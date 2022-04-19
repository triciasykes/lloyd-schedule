require 'test_helper'

class WorkOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get work_orders_index_url
    assert_response :success
  end

  test "should get new" do
    get work_orders_new_url
    assert_response :success
  end

  test "should get create" do
    get work_orders_create_url
    assert_response :success
  end

  test "should get show" do
    get work_orders_show_url
    assert_response :success
  end

end
