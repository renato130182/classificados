require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "nome é brigatorio" do
    user = User.new(name: nil)
    user.save
    assert user.errors[:name].any?
  end

  test "Email é brigatorio e possui formato valido" do
    #valida email null
    user = User.new(email: nil)
    user.save
    assert user.errors[:email].any?
    #valida email invalido
    user = User.new(email:"invalido")
    user.save
    assert user.errors[:email].any?
    #valida email valid
    user = User.new(email: "teste@123.com")
    user.save
    refute user.errors[:email].any?

  end

  test "Email unico" do
    user = User.create!(name: "Renato", email: "teste@123.com",password: "123@123", password_confirmation: "123@123")
    other = User.create(name: "Renato", email: "teste@123.com",password: "123@123", password_confirmation: "123@123")
    assert other.errors[:email].any?
  end
  
end
