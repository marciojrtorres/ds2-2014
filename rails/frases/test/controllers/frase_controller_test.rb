require 'test_helper'

class FraseControllerTest < ActionController::TestCase
  test "should get todas" do
    get :todas
    assert_response :success
  end

end
