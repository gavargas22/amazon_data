# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160628044512) do

  create_table "customers", force: :cascade do |t|
    t.string   "amazon_order_id"
    t.datetime "puchased_at"
    t.datetime "last_updated_at"
    t.string   "status"
    t.string   "fullfilment_channel"
    t.string   "sales_channel"
    t.string   "order_channel"
    t.string   "ship_service_level"
    t.string   "shipping_address_name"
    t.string   "shipping_address_lines"
    t.string   "address_name_city"
    t.string   "shipping_address_state_or_region"
    t.string   "shipping_address_postal_code"
    t.string   "shipping_address_country_code"
    t.string   "shipping_address_phone"
    t.string   "total_sale_amount"
    t.integer  "number_of_items_shipped"
    t.integer  "number_of_items_unshipped"
    t.string   "payment_execution_detail"
    t.string   "payment_method"
    t.string   "marketplace_id"
    t.string   "buyer_name"
    t.string   "buyer_email"
    t.string   "shipment_service_level_category"
    t.string   "cba_displayable_shipping_label"
    t.boolean  "shipped_by_amazon_tfm"
    t.string   "tfm_shipment_status"
    t.string   "order_type"
    t.datetime "earliest_shipped_at"
    t.datetime "latest_shipped_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "products_id"
  end

  add_index "customers", ["products_id"], name: "index_customers_on_products_id"

  create_table "products", force: :cascade do |t|
    t.string   "asin"
    t.string   "seller_sku"
    t.string   "order_item_id"
    t.string   "title"
    t.integer  "quantity_ordered"
    t.integer  "quantity_shipped"
    t.string   "gift_message_text"
    t.string   "gift_wrap_level"
    t.float    "item_price"
    t.float    "shipping_price"
    t.float    "gift_wrap_price"
    t.float    "item_tax"
    t.float    "shipping_tax"
    t.float    "gift_wrap_tax"
    t.float    "shipping_discount"
    t.float    "promotion_discount"
    t.string   "promotion_ids"
    t.string   "cod_fee"
    t.string   "cod_fee_discount"
    t.string   "invoice_data"
    t.string   "condition_id"
    t.string   "condition_subtype_id"
    t.string   "condition_note"
    t.datetime "scheduled_delivery_ends_at"
    t.datetime "scheduled_delivery_starts_at"
    t.integer  "customer_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "products", ["customer_id"], name: "index_products_on_customer_id"

end
