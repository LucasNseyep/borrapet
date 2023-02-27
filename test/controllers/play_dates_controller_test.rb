require "test_helper"

class PlayDatesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get play_dates_create_url
    assert_response :success
  end

  test "should get index" do
    get play_dates_index_url
    assert_response :success
  end
end
