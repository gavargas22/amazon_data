require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post :create, customer: { address_name_city: @customer.address_name_city, amazon_order_id: @customer.amazon_order_id, buyer_email: @customer.buyer_email, buyer_name: @customer.buyer_name, cba_displayable_shipping_label: @customer.cba_displayable_shipping_label, earliest_shipped_at: @customer.earliest_shipped_at, fullfilment_channel: @customer.fullfilment_channel, last_updated_at: @customer.last_updated_at, latest_shipped_at: @customer.latest_shipped_at, marketplace_id: @customer.marketplace_id, number_of_items_shipped: @customer.number_of_items_shipped, number_of_items_unshipped: @customer.number_of_items_unshipped, order_channel: @customer.order_channel, payment_execution_detail: @customer.payment_execution_detail, payment_method: @customer.payment_method, puchased_at: @customer.puchased_at, sales_channel: @customer.sales_channel, ship_service_level: @customer.ship_service_level, shipment_service_level_category: @customer.shipment_service_level_category, shipped_by_amazon_tfm: @customer.shipped_by_amazon_tfm, shipping_address_country_code: @customer.shipping_address_country_code, shipping_address_lines: @customer.shipping_address_lines, shipping_address_name: @customer.shipping_address_name, shipping_address_phone: @customer.shipping_address_phone, shipping_address_postal_code: @customer.shipping_address_postal_code, shipping_address_state_or_region: @customer.shipping_address_state_or_region, status: @customer.status, tfm_shipment_status: @customer.tfm_shipment_status, total_sale_amount: @customer.total_sale_amount, type: @customer.type }
    end

    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should show customer" do
    get :show, id: @customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer
    assert_response :success
  end

  test "should update customer" do
    patch :update, id: @customer, customer: { address_name_city: @customer.address_name_city, amazon_order_id: @customer.amazon_order_id, buyer_email: @customer.buyer_email, buyer_name: @customer.buyer_name, cba_displayable_shipping_label: @customer.cba_displayable_shipping_label, earliest_shipped_at: @customer.earliest_shipped_at, fullfilment_channel: @customer.fullfilment_channel, last_updated_at: @customer.last_updated_at, latest_shipped_at: @customer.latest_shipped_at, marketplace_id: @customer.marketplace_id, number_of_items_shipped: @customer.number_of_items_shipped, number_of_items_unshipped: @customer.number_of_items_unshipped, order_channel: @customer.order_channel, payment_execution_detail: @customer.payment_execution_detail, payment_method: @customer.payment_method, puchased_at: @customer.puchased_at, sales_channel: @customer.sales_channel, ship_service_level: @customer.ship_service_level, shipment_service_level_category: @customer.shipment_service_level_category, shipped_by_amazon_tfm: @customer.shipped_by_amazon_tfm, shipping_address_country_code: @customer.shipping_address_country_code, shipping_address_lines: @customer.shipping_address_lines, shipping_address_name: @customer.shipping_address_name, shipping_address_phone: @customer.shipping_address_phone, shipping_address_postal_code: @customer.shipping_address_postal_code, shipping_address_state_or_region: @customer.shipping_address_state_or_region, status: @customer.status, tfm_shipment_status: @customer.tfm_shipment_status, total_sale_amount: @customer.total_sale_amount, type: @customer.type }
    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete :destroy, id: @customer
    end

    assert_redirected_to customers_path
  end
end
