require 'test_helper'

class RankingControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get ranking_all_url
    assert_response :success
  end

end
