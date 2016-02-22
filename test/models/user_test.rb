require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "Frank Zappa", email: "frank@zappa.com", 
    	   					   password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "email should be present" do
  	@user.email = ""
  	assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be to long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept vaild addresses" do
  	valid_addressess = %w[user@example.com USER@ffoo.COM A_US-ER@foo.bar.org
  											 first.last@foo.jp alice+bob@baz.cn]
  	valid_addressess.each do |valid_address|
  		@user.email = valid_address
  		assert @user.valid?, "#{valid_address.inspect} should be valid"
  	end
  end

  test "email validation should reject invaild addresses" do
  	invalid_addressess = %w[user@example,com user_at_foo_.org user.name@example.
  											 foo@bar_baz.com foo@bar+baz.com]
  	invalid_addressess.each do |invalid_address|
  		@user.email = invalid_address
  		assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
  	end
  end

  test "email address should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save 
    assert_not duplicate_user.valid?
  end

  test "password should be present" do
  	@user.password = @user.password_confirmation = "  " * 6
  	assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
  	assert_not @user.valid?
  end

end
