class Product < ActiveRecord::Base
	belongs_to :customer

	def self.assign_products_to_customer
		# Initiate the connection
		client = MWS.orders(primary_marketplace_id: MWS_MARKETPLACE_ID,	merchant_id:MWS_MERCHANT_ID, aws_access_key_id: AWS_ACCESS_KEY_ID, aws_secret_access_key:AWS_SECRET_ACCESS_KEY)

		# Get the total number customers.
		all_customers = Customer.all
		# Start off with the first customer
		customer_index_number = 0

		# While the number of customers in the iteration has not reached the maximum
		while customer_index_number < all_customers.count
			# For each customer
			all_customers.each_with_index do |customer, index|
				# Do the 30 requests
				30.times do
					# Get all the order items
					orders = client.list_order_items(customer.amazon_order_id).parse
					# Do each order and assign it its data
					orders.each do |order|
						# Create a new object
						new_product_object = Product.new
						# Do it for all the attributes
						new_product_object.asin = order.asin
						new_product_object.seller_sku = order.seller_sku
						new_product_object.order_item_id = order.order_item_id
						new_product_object.title = order.title
						new_product_object.quantity_ordered = order.quantity_ordered
						new_product_object.quantity_shipped = order.quantity_shipped
						new_product_object.gift_message_text = order.gift_message_text
						new_product_object.gift_wrap_level = order.gift_wrap_level
						new_product_object.item_price = order.item_price
						new_product_object.shipping_price = order.shipping_price
						new_product_object.gift_wrap_price = order.gift_wrap_price
						new_product_object.item_tax = order.item_tax
						new_product_object.shipping_tax = order.shipping_tax
						new_product_object.gift_wrap_tax = order.gift_wrap_tax
						new_product_object.shipping_discount = order.shipping_discount
						new_product_object.promotion_discount = order.promotion_discount
						new_product_object.promotion_ids = order.promotion_ids
						new_product_object.cod_fee = order.cod_fee
						new_product_object.cod_fee_discount = order.cod_fee_discount
						new_product_object.invoice_data = order.invoice_data
						new_product_object.condition_id = order.condition_id
						new_product_object.condition_subtype_id = order.condition_subtype_id
						new_product_object.condition_note = order.condition_note
						new_product_object.scheduled_delivery_ends_at = order.scheduled_delivery_ends_at
						new_product_object.scheduled_delivery_starts_at = order.scheduled_delivery_starts_at
						# Save the object
						new_product_object.save!
						# Customer
						customer.products << new_product_object
						# Print the index for debugging
						puts index
						byebug
					end
					# Increase the index
					customer_index_number = index
				end
				puts "I am going to sleep for 30 seconds"
				# Then wait for 60 seconds to avoid throtling, the do it again.
				sleep(60.seconds)
			end
		end

	end
end
