require 'test_helper'

class TechniciansControllerTest < ActionDispatch::IntegrationTest
  
    test 'it should get all' do
      get technicians_url
      assert_response :success
    end
end
