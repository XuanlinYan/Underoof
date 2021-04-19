require "test_helper"

class PreferencesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:xulin)
  end

  def sign_in_first(user)
    post signin_path, params: { session: { email: user.email, password: "password" }}
  end 

  test "should redirect search when not signed in" do
    get search_path
    assert_not flash.empty?
    assert_redirected_to signin_url
  end

  test "successful search" do
    sign_in_first(@user)
    get search_path
    assert_template 'preferences/index'
  end
end
