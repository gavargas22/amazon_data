class CreateCustomers < ActiveRecord::Migration
	def change
		create_table :customers do |t|
			t.string :amazon_order_id
			t.datetime :puchased_at
			t.datetime :last_updated_at
			t.string :status
			t.string :fullfilment_channel
			t.string :sales_channel
			t.string :order_channel
			t.string :ship_service_level
			t.string :shipping_address_name
			t.string :shipping_address_lines
			t.string :address_name_city
			t.string :shipping_address_state_or_region
			t.string :shipping_address_postal_code
			t.string :shipping_address_country_code
			t.string :shipping_address_phone
			t.string :total_sale_amount
			t.integer :number_of_items_shipped
			t.integer :number_of_items_unshipped
			t.string :payment_execution_detail
			t.string :payment_method
			t.string :marketplace_id
			t.string :buyer_name
			t.string :buyer_email
			t.string :shipment_service_level_category
			t.string :cba_displayable_shipping_label
			t.boolean :shipped_by_amazon_tfm
			t.string :tfm_shipment_status
			t.string :order_type
			t.datetime :earliest_shipped_at
			t.datetime :latest_shipped_at

			t.timestamps null: false
		end
	end
end
