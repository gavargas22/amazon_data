class Customer < ActiveRecord::Base
	require "peddler"
	require "mws-orders"

	has_many :products

	# Start the importing of customer data, give it the argument of how far into the past you want to go to.
	def self.import_data(time_number)
		# Initiate the connection
		client = MWS.orders(primary_marketplace_id: MWS_MARKETPLACE_ID,	merchant_id:MWS_MERCHANT_ID, aws_access_key_id: AWS_ACCESS_KEY_ID, aws_secret_access_key:AWS_SECRET_ACCESS_KEY)

		# Get the first page of orders and parse them using the time frame
		orders = client.list_orders(created_after: time_number.days.ago).parse

		# Iterate over the whole order list and save them.
		while orders.next_token != nil
			# Execute 6 times, the loop and wait for 1 minute.
			6.times do
				orders.each do |order|
					# Create an object to store the info in.
					order_object = Customer.find_by_amazon_order_id(order.amazon_order_id)
					# If the object was not found above, then create a new one.
					order_object = Customer.new if order_object.nil?
					# Get the info to everywhere that's needed.
					order_object.amazon_order_id = order.amazon_order_id
					order_object.puchased_at = order.purchased_at
					order_object.last_updated_at = order.last_updated_at
					order_object.status = order.status
					order_object.fullfilment_channel = order.fulfillment_channel
					order_object.sales_channel = order_channel = order.sales_channel
					order_object.ship_service_level = order.ship_service_level
					# For canceled orders
					if order.shipping_address == nil
						order_object.shipping_address_name = "N/A"
						order_object.shipping_address_lines = "N/A"
						order_object.address_name_city = "N/A"
						order_object.shipping_address_state_or_region = "N/A"
						order_object.shipping_address_postal_code = "N/A"
						order_object.shipping_address_country_code = "N/A"
						order_object.shipping_address_phone = "N/A"
					else
						order_object.shipping_address_name = order.shipping_address.name
						order_object.shipping_address_lines = order.shipping_address.address_lines[0]
						order_object.address_name_city = order.shipping_address.city
						order_object.shipping_address_state_or_region = order.shipping_address.state_or_region
						order_object.shipping_address_postal_code = order.shipping_address.postal_code
						order_object.shipping_address_country_code = order.shipping_address.country_code
						order_object.shipping_address_phone = order.shipping_address.phone
					end
					order_object.total_sale_amount = order.total
					order_object.number_of_items_shipped = order.number_of_items_shipped
					order_object.number_of_items_unshipped = order.number_of_items_unshipped
					order_object.payment_execution_detail = order.payment_execution_detail
					order_object.payment_method = order.payment_method
					order_object.marketplace_id = order.marketplace_id
					order_object.buyer_name = order.buyer_name
					order_object.buyer_email = order.buyer_email
					order_object.shipment_service_level_category = order.shipment_service_level_category
					order_object.cba_displayable_shipping_label = order.cba_displayable_shipping_label
					order_object.shipped_by_amazon_tfm = order.shipped_by_amazon_tfm
					order_object.tfm_shipment_status = order.tfm_shipment_status
					order_object.order_type = order.type
					order_object.earliest_shipped_at = order.earliest_shipped_at
					order_object.latest_shipped_at = order.latest_shipped_at
					# Save the objects
					order_object.save!
				end
				# I wait one minute to avoid throttling
				orders = client.list_orders_by_next_token(orders.next_token).parse
			end
			sleep(360.seconds)
		end

	end


end
