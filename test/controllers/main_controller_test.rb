require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get display" do
    get main_display_url
    assert_response :success
  end

end
