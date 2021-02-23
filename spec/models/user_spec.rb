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
        expect(@user.errors.full_messages).to  include("ニックネームを入力してください")#エラー文
      end
      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end     
      it 'emailに＠がないと登録できないこと' do
        @user.email = 'exsamplegmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it "重複したemailが存在する場合登録できない" do 
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'psaawordは６文字以上でないと登録できない'do
        @user.password = "123as"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end 
      it "passwordは英字のみでは登録できない" do 
        @user.password = "abcdefg"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは＠を含んだ半角英数字を使用してください")
      end
      it "passwordは数字のみでは登録できない" do 
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは＠を含んだ半角英数字を使用してください")
      end
      it "passwordは全角では登録できない" do
        @user.password = "１２３４５A"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは＠を含んだ半角英数字を使用してください")
      end
      it "passwordは半角英数字混合でなければ登録できない" do
        @user.password = "765283"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは＠を含んだ半角英数字を使用してください")
      end
      it "password_confirmationが空では登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it  "first_nameが空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include( "名を入力してください")
      end
      it  "family_nameが空だと登録できない" do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓を入力してください")
      end
      it "first_nameが全角でなければ登録できない"do
        @user.first_name = "ryouhei"
        @user.valid?
        expect(@user.errors.full_messages).to include("名は全角文字で入力してください")
      end
      it  "family_nameが全角でなければ登録できない" do
        @user.family_name = "yamaguchi"
        @user.valid?
        expect(@user.errors.full_messages).to include("姓は全角文字で入力してください")
      end
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名フリガナを入力してください")
      end
      it "family_name_kanaが空だと登録できない" do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓フリガナを入力してください")
      end
      it "family_name_kanaが全角（カタカナ）でなければ登録できない" do
        @user.family_name_kana = "yamaguchi"
        @user.valid?
        expect(@user.errors.full_messages).to include("姓フリガナは全角文字で入力してください")
      end
      it "first_name_kanaが全角（カタカナ）でなければ登録できない" do 
        @user.first_name_kana = "ryohei"
        @user.valid?
        expect(@user.errors.full_messages).to include("名フリガナは全角文字で入力してください")
      end
      it "生年月日が空では登録できない" do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end