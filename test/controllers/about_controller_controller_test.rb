require 'test_helper'

class AboutControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get about_controller_index_url
    assert_response :success
  end

end
