require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @psw_user = User.new(name: "Example User", gender:"Male", email: "user@example.com", password: "Foobarbar123", password_confirmation: "Foobarbar123")
  end

  test "User name should be present" do
    @user = User.new(name: "  ", gender:"Male", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
    assert_not @user.valid?
  end

  test "User gender should be present" do
    @user = User.new(name: "Example User", gender:" ", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
    assert_not @user.valid?
  end

  test "User email should be present" do
    @user = User.new(name: "Example User",gender:"Male", email: "   ", password: "foobar", password_confirmation: "foobar")
    assert_not @user.valid?
  end

  test "User email should be valid" do
    @user = User.new(name: "Example User",gender:"Male", email: "userexample.com", password: "foobar", password_confirmation: "foobar")
    assert_not @user.valid?
  end

  test "User email should be unique" do
    @user = User.new(name: "Example User", gender:"Male", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "User password should be present (nonblank)" do
    @user = User.new(name: "Example User", gender:"Male", email: "user@example.com", password: " ", password_confirmation: "foobar")
    assert_not @user.valid?
  end

  test "User password should have a minimum 8 length" do
    @user = User.new(name: "Example User",gender:"Male", email: "user@example.com", password: "foobr", password_confirmation: "foar")
    assert_not @user.valid?
  end

 
  test "User password and password confirmation should be same" do
    @user = User.new(name: "Example User",gender:"Male", email: "user@example.com", password: "foobar", password_confirmation: "foo2131bar")
    assert_not @user.valid?
  end

  test "password should have at least one number and one char or one symbol" do
    @user = User.new(name: "Example User",gender:"Male", email: "user@example.com", password: "Foobarfoobar", password_confirmation: "Foobarfoobar")
    assert_not @user.valid?
  end

  test "password should include Upper, Lower, Number. length: 8-15" do
    valid_passwords = %w[Afoobar123 pAAAA111 PaPa1111 aaaapppA222A]
    valid_passwords.each do |valid_password|
      @psw_user.password = valid_password
      @psw_user.password_confirmation = valid_password
      assert @psw_user.valid?
    end
  end
end
