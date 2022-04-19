require 'test_helper'

class WorkOrdersControllerTest < ActionDispatch::IntegrationTest
 
    test 'it should get all' do
      get work_orders_url
      assert_response :success
    end

end
