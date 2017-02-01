require 'test_helper'

class AlolashiniesControllerTest < ActionController::TestCase
  test "should get tool" do
    get :tool
    assert_response :success
  end

end
