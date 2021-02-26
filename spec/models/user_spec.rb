require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context 'ユーザー登録がうまくいくとき' do
      it "nickname,email,password,last_name,first_name,last_name_kana,first_name_kana,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが６文字以上であれば登録できる" do
        @user.password = 'a123456'
        @user.password_confirmation = 'a123456'
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録がうまくいかないとき' do
      it "nicknameが空だととうろくできない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailは@を含まないと登録できない" do
        @user.email = 'hoge'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが５文字以下では登録できない" do
        @user.password = 'a1234'
        @user.password_confirmation = "a1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordとpassword_confirmationが不一致では登録できないこと" do
        @user.password = "a12345"
        @user.password_confirmation = "b12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordに半角英数字が入っていないと登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordは英字のみでは登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordは全角文字では登録できない" do
        @user.password = "ａ１２３４５"
        @user.password_confirmation = "ａ１２３４５"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameは全角でないと登録できない" do
        @user.last_name = 'hoge1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameは全角でないと登録できない" do
        @user.first_name = 'hoge2'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "last_name_kanaは全角カタカナでないと登録できない" do
        @user.last_name_kana = 'ほげ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "last_name_kanaは半角文字では登録できない" do
        @user.last_name_kana = 'ﾎｹﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "first_name_kanaは全角カタカナでないと登録できない" do
        @user.first_name_kana = 'ほげ二'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "first_name_kanaは半角文字では登録できない" do
        @user.first_name_kana = 'ﾎｹﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end