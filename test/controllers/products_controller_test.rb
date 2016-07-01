require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { asin: @product.asin, cod_fee: @product.cod_fee, cod_fee_discount: @product.cod_fee_discount, condition_id: @product.condition_id, condition_note: @product.condition_note, condition_subtype_id: @product.condition_subtype_id, customer_id: @product.customer_id, gift_message_text: @product.gift_message_text, gift_wrap_level: @product.gift_wrap_level, gift_wrap_price: @product.gift_wrap_price, gift_wrap_tax: @product.gift_wrap_tax, invoice_data: @product.invoice_data, item_price: @product.item_price, item_tax: @product.item_tax, order_item_id: @product.order_item_id, promotion_discount: @product.promotion_discount, promotion_ids: @product.promotion_ids, quantity_ordered: @product.quantity_ordered, quantity_shipped: @product.quantity_shipped, scheduled_delivery_ends_at: @product.scheduled_delivery_ends_at, scheduled_delivery_starts_at: @product.scheduled_delivery_starts_at, seller_sku: @product.seller_sku, shipping_discount: @product.shipping_discount, shipping_price: @product.shipping_price, shipping_tax: @product.shipping_tax, title: @product.title }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { asin: @product.asin, cod_fee: @product.cod_fee, cod_fee_discount: @product.cod_fee_discount, condition_id: @product.condition_id, condition_note: @product.condition_note, condition_subtype_id: @product.condition_subtype_id, customer_id: @product.customer_id, gift_message_text: @product.gift_message_text, gift_wrap_level: @product.gift_wrap_level, gift_wrap_price: @product.gift_wrap_price, gift_wrap_tax: @product.gift_wrap_tax, invoice_data: @product.invoice_data, item_price: @product.item_price, item_tax: @product.item_tax, order_item_id: @product.order_item_id, promotion_discount: @product.promotion_discount, promotion_ids: @product.promotion_ids, quantity_ordered: @product.quantity_ordered, quantity_shipped: @product.quantity_shipped, scheduled_delivery_ends_at: @product.scheduled_delivery_ends_at, scheduled_delivery_starts_at: @product.scheduled_delivery_starts_at, seller_sku: @product.seller_sku, shipping_discount: @product.shipping_discount, shipping_price: @product.shipping_price, shipping_tax: @product.shipping_tax, title: @product.title }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
