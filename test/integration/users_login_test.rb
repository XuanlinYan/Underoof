require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user = users(:zheng)
  end
  
  
  test "login with empty name" do
    get signin_path
    assert_template 'sessions/new'
    post signin_path, params: { session: { name: "", password: "Password123"} }
    assert_template 'sessions/new'
    assert_not flash.empty?
  end
  
  test "login with empty password" do
    get signin_path
    assert_template 'sessions/new'
    post signin_path, params: { session: { name: "zheng", password: ""} }
    assert_template 'sessions/new'
    assert_not flash.empty?
  end

  test "successful login" do
    get signin_path
    assert_template 'sessions/new'
    post signin_path, params: { session: { name: "Zheng", password: "Password123"} }
    assert_redirected_to root_path
    assert flash.empty?
    assert_equal "Zheng", @user.name
    assert_equal "zheng@example.com", @user.email
    assert_equal "Male", @user.gender

  end

end
