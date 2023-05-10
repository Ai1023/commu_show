require "test_helper"

class Customer::JoinEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get customer_join_events_create_url
    assert_response :success
  end

  test "should get destroy" do
    get customer_join_events_destroy_url
    assert_response :success
  end
end
