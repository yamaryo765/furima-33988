require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
    @user = FactoryBot.build(:user)
    end
    context "新規登録できるとき" do
      it "全ての項目が正しく入力されていれば登録できること" do
        expect(@user).to be_valid
      end
    end
    context "新規登録できないとき" do
      it 'nicknameが空では登録できないこと' do
        @user.nickname = ''
        @user.valid? #trueかfalseを調べる
        expect(@user.errors.full_messages).to  include("Nickname can't be blank")#エラー文
      end
      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end     
      it 'emailに＠がないと登録できないこと' do
        @user.email = 'exsamplegmail.com'
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
      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'psaawordは６文字以上でないと登録できない'do
        @user.password = "123as"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end 
      it "passwordは英字のみでは登録できない" do 
        @user.password = "abcdefg"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordは数字のみでは登録できない" do 
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordは全角では登録できない" do
        @user.password = "１２３４５A"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordは半角英数字混合でなければ登録できない" do
        @user.password = "765283"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "password_confirmationが空では登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it  "first_nameが空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include( "First name can't be blank")
      end
      it  "family_nameが空だと登録できない" do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "first_nameが全角でなければ登録できない"do
        @user.first_name = "ryouhei"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it  "family_nameが全角でなければ登録できない" do
        @user.family_name = "yamaguchi"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "family_name_kanaが空だと登録できない" do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it "family_name_kanaが全角（カタカナ）でなければ登録できない" do
        @user.family_name_kana = "yamaguchi"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end
      it "first_name_kanaが全角（カタカナ）でなければ登録できない" do 
        @user.first_name_kana = "ryohei"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "生年月日が空では登録できない" do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end