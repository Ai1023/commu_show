require "test_helper"

class Customer::EventCalendersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_event_calenders_index_url
    assert_response :success
  end

  test "should get show" do
    get customer_event_calenders_show_url
    assert_response :success
  end
end
