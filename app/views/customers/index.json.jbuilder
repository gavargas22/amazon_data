json.array!(@customers) do |customer|
	json.extract! customer, :id, :amazon_order_id, :puchased_at, :last_updated_at, :status, :fullfilment_channel, :sales_channel, :order_channel, :ship_service_level, :shipping_address_name, :shipping_address_lines, :address_name_city, :shipping_address_state_or_region, :shipping_address_postal_code, :shipping_address_country_code, :shipping_address_phone, :total_sale_amount, :number_of_items_shipped, :number_of_items_unshipped, :payment_execution_detail, :payment_method, :marketplace_id, :buyer_name, :buyer_email, :shipment_service_level_category, :cba_displayable_shipping_label, :shipped_by_amazon_tfm, :tfm_shipment_status, :order_type, :earliest_shipped_at, :latest_shipped_at
	json.url customer_url(customer, format: :json)
end
