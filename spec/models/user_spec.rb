require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できる場合' do
      if "全て存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録ができない場合' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      @user.email = ''
      @user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123457'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confimation doesn't match Password")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emaiは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it "last_nameが空だと登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(user.errors.full_messages).to include("last_name can't be blank")
    end
    it "first_nameが空だと登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(user.errors.full_messages).to include("first_name can't be blank")
    end
    it "last_name_kanaが空では登録できない" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("last_name_kana can't be blank")
    end
    it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(user.errors.full_messages).to include("first_name_kana can't be blank")
    end
    it "birthdayが空だと登録できない" do
      @user.birthday = ''
      @user.valid?
      expect(user.errors.full_messages).to include("birthday can't be blank")
    end

   end
  end
end