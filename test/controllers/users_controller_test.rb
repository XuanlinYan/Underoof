require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:xulin)
    @other_user = users(:zheng)
  end

  def sign_in_first(user)
    post signin_path, params: { session: { email: user.email, password: "password" }}
  end 

  test "should redirect edit when not signed in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to signin_url
  end

  test "should redirect update when not signed in" do
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email,
                                              gender:@user.gender } }
    assert_not flash.empty?
    assert_redirected_to signin_url
  end

  test "should redirect edit when signed in as wrong user" do
    # post signin_path, params: { session: { email: @other_user.email, password: "password" }}
    sign_in_first(@other_user)
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to root_url
  end 

  test "should redirect update when logged in as wrong user" do
    sign_in_first(@other_user)
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email,
                                              gender: @user.gender } }
    assert_not flash.empty?
    assert_redirected_to root_url
  end
end
