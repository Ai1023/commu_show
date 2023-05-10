require "test_helper"

class Admin::EventCalendersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_event_calenders_new_url
    assert_response :success
  end

  test "should get show" do
    get admin_event_calenders_show_url
    assert_response :success
  end

  test "should get index" do
    get admin_event_calenders_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_event_calenders_edit_url
    assert_response :success
  end

  test "should get create" do
    get admin_event_calenders_create_url
    assert_response :success
  end

  test "should get update" do
    get admin_event_calenders_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_event_calenders_destroy_url
    assert_response :success
  end
end
