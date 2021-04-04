require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:xulin)
  end
  
  def sign_in_first(user)
    post signin_path, params: { session: { email: user.email, password: "password" }}
  end 

  test "unsuccessful edit" do
    sign_in_first(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name:  "",
                                              email: "foo@invalid",
                                              password:              "foo",
                                              password_confirmation: "bar", 
                                              gender: "Male"} }

    assert_template 'users/edit'
    assert_select "div.alert", text: "The form contains 4 errors."
  end

  test "successful edit" do
    sign_in_first(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    name  = "Foo Bar"
    email = "foo@bar.com"
    gender = "Prefer not to answer"
    patch user_path(@user), params: { user: { name:  name,
                                              email: email,
                                              password:              "",
                                              password_confirmation: "",
                                              gender: gender} }
    assert_not flash.empty?
    assert_redirected_to edit_user_path(@user)
    @user.reload
    assert_equal name,  @user.name
    assert_equal email, @user.email
    assert_equal gender, @user.gender
  end
end
