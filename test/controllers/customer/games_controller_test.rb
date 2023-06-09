require "test_helper"

class Customer::GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customer_games_new_url
    assert_response :success
  end

  test "should get show" do
    get customer_games_show_url
    assert_response :success
  end

  test "should get edit" do
    get customer_games_edit_url
    assert_response :success
  end

  test "should get index" do
    get customer_games_index_url
    assert_response :success
  end

  test "should get create" do
    get customer_games_create_url
    assert_response :success
  end

  test "should get update" do
    get customer_games_update_url
    assert_response :success
  end

  test "should get destroy" do
    get customer_games_destroy_url
    assert_response :success
  end
end
