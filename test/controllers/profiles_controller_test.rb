require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:chris).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should render a 404 on profile not found" do
    get :show, id: "doesn't exist"
    assert_response :not_found
  end

  test "that variables are assigned on successful profile viewing" do
    get :show, id: users(:chris).profile_name
    assert assigns(:user)
    assert_not_empty assigns(:events)
  end

  test "only shows the correct user's events" do
    get :show, id: users(:chris).profile_name
    assigns(:events).each do |event|
      assert_equal users(:chris), event.user
    end
  end
end
