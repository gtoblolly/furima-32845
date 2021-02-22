require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だととうろくできない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "000000", password_confirmation: "000000", last_name: "ご", first_name: "け", last_name_kana: "ゴ", first_name_kana: "ケ", birthday: "ggg")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank", "Birthday can't be blank")
    end
    it "emailが空では登録できない" do
      user = User.new(nickname: "keen", email: "", password: "000000", password_confirmation: "000000", last_name: "ご", first_name: "け", last_name_kana: "ゴ", first_name_kana: "ケ", birthday: "ggg")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank", "Birthday can't be blank")
    end
    it "passwordが空では登録できない" do
      user = User.new(nickname: "keen", email: "kkk@gmail.com", password: "", password_confirmation: "000000", last_name: "ご", first_name: "け", last_name_kana: "ゴ", first_name_kana: "ケ", birthday: "ggg")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password", "Birthday can't be blank")
    end
    it "last_nameが空では登録できない" do
      user = User.new(nickname: "keen", email: "kkk@gmail.com", password: "000000", password_confirmation: "000000", last_name: "", first_name: "け", last_name_kana: "ゴ", first_name_kana: "ケ", birthday: "ggg")
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank", "Birthday can't be blank")
    end
    it "first_nameが空では登録できない" do
      user = User.new(nickname: "keen", email: "kkk@gmail.com", password: "000000", password_confirmation: "000000", last_name: "ご", first_name: "", last_name_kana: "ゴ", first_name_kana: "ケ", birthday: "ggg")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank", "Birthday can't be blank")
    end
    it "last_name_kanaが空では登録できない" do
      user = User.new(nickname: "keen", email: "kkk@gmail.com", password: "000000", password_confirmation: "000000", last_name: "ご", first_name: "け", last_name_kana: "", first_name_kana: "ケ", birthday: "ggg")
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank", "Birthday can't be blank")
    end
    it "first_name_kanaが空では登録できない" do
      user = User.new(nickname: "keen", email: "kkk@gmail.com", password: "000000", password_confirmation: "000000", last_name: "ご", first_name: "け", last_name_kana: "ゴ", first_name_kana: "", birthday: "ggg")
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank", "Birthday can't be blank")
    end
    it "birthdayが空では登録できない" do
      user = User.new(nickname: "keen", email: "kkk@gmail.com", password: "000000", password_confirmation: "000000", last_name: "ご", first_name: "け", last_name_kana: "ゴ", first_name_kana: "ケ", birthday: "")
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
