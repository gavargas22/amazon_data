class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :asin
      t.string :seller_sku
      t.string :order_item_id
      t.string :title
      t.integer :quantity_ordered
      t.integer :quantity_shipped
      t.string :gift_message_text
      t.string :gift_wrap_level
      t.float :item_price
      t.float :shipping_price
      t.float :gift_wrap_price
      t.float :item_tax
      t.float :shipping_tax
      t.float :gift_wrap_tax
      t.float :shipping_discount
      t.float :promotion_discount
      t.string :promotion_ids
      t.string :cod_fee
      t.string :cod_fee_discount
      t.string :invoice_data
      t.string :condition_id
      t.string :condition_subtype_id
      t.string :condition_note
      t.datetime :scheduled_delivery_ends_at
      t.datetime :scheduled_delivery_starts_at
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
