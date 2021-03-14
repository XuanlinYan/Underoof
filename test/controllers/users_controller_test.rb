require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  test "User name should be present" do
    @user = User.new(name: "  ", gender:"Male", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
    assert @user.valid?
  end

  test "User gender should be present" do
    @user = User.new(name: "Example User", gender:" ", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
    assert @user.valid?
  end

  test "User email should be present" do
    @user = User.new(name: "Example User",gender:"Male", email: "   ", password: "foobar", password_confirmation: "foobar")
    assert @user.valid?
  end

  test "User email should be valid" do
    @user = User.new(name: "Example User",gender:"Male", email: "userexample.com", password: "foobar", password_confirmation: "foobar")
    assert @user.valid?
  end

  test "User email should be unique" do
    @user = User.new(name: "Example User", gender:"Male", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
    duplicate_user = @user.dup
    @user.save
    assert duplicate_user.valid?
  end

  test "User password should be present (nonblank)" do
    @user = User.new(name: "Example User", gender:"Male", email: "user@example.com", password: " ", password_confirmation: "foobar")
    assert @user.valid?
  end

  test "User password should have a minimum 8 length" do
    @user = User.new(name: "Example User",gender:"Male", email: "user@example.com", password: "foobr", password_confirmation: "foar")
    assert @user.valid?
  end

 
  test "User password and password confirmation should be same" do
    @user = User.new(name: "Example User",gender:"Male", email: "user@example.com", password: "foobar", password_confirmation: "foo2131bar")
    assert @user.valid?
  end

end
