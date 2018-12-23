require 'test_helper'

class PictureControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get picture_index_url
    assert_response :success
  end

  test "should get new" do
    get picture_new_url
    assert_response :success
  end

  test "should get confirm" do
    get picture_confirm_url
    assert_response :success
  end

  test "should get show" do
    get picture_show_url
    assert_response :success
  end

  test "should get edit" do
    get picture_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get picture_destroy_url
    assert_response :success
  end

end
