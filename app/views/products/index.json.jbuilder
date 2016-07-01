json.array!(@products) do |product|
  json.extract! product, :id, :asin, :seller_sku, :order_item_id, :title, :quantity_ordered, :quantity_shipped, :gift_message_text, :gift_wrap_level, :item_price, :shipping_price, :gift_wrap_price, :item_tax, :shipping_tax, :gift_wrap_tax, :shipping_discount, :promotion_discount, :promotion_ids, :cod_fee, :cod_fee_discount, :invoice_data, :condition_id, :condition_subtype_id, :condition_note, :scheduled_delivery_ends_at, :scheduled_delivery_starts_at, :customer_id
  json.url product_url(product, format: :json)
end
