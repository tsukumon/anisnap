require 'test_helper'

class SettingControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get setting_profile_url
    assert_response :success
  end

end
