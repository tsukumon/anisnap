require 'test_helper'

class NewsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get news_home_url
    assert_response :success
  end

end
