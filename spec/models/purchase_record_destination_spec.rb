require 'rails_helper'
RSpec.describe PurchaseRecordsDestination, type: :model do
  describe "商品購入機能" do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_record = FactoryBot.build(:purchase_records_destination,user_id:user.id,item_id:item.id)
    end
    context  "購入できるとき" do
      it  "全ての項目が正しく入力されていれば登録できること" do
        expect(@purchase_record).to be_valid
      end
    end
    context "購入できないとき" do
        it "郵便番号がないと購入できない" do
        @purchase_record.post_code = ""
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("Post code can't be blank")
      end
      it  "郵便番号が半角のハイフンを含んだ正しい形式でないと購入できないこと" do
        @purchase_record.post_code = "1234567"
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it "都道府県を入力していないと購入できないこと" do
        @purchase_record.shipping_area_id = ''
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("Shipping area can't be blank")
      end
      it "発送元idが0以外でないと購入できない" do
        @purchase_record.shipping_area_id = 0
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("Shipping area can't be blank")
      end
      it "市区町村が入力されていないと購入できないこと" do
        @purchase_record.city = ''
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("City can't be blank")
      end
      it "市区町村が数字を含むと購入できないこと" do #ちなみに数字を含む市区町村は存在どころか、日本の見解によると認められていない。（日本語としてふさわしくないため）正規表現の検証
        @purchase_record.city = '東京23区'
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("City is invalid. Input full-width characters.")
      end
      it "電話番号が入力されていないと購入できないこと" do
        @purchase_record.phone_number = ''
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include( "Phone number can't be blank")
      end
      it "電話番号は11桁以内でなければ認められない" do
        @purchase_record.phone_number = "1234"
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("Phone number is invalid.")
      end
      it "電話番号は数字でなくては認められない" do
        @purchase_record.phone_number = '電話番号は数字only！!！'
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("Phone number is invalid.")
      end
      it "クレジットカード入力がなければ購入できない" do
        @purchase_record.token = ''
        @purchase_record.valid?
        expect(@purchase_record.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
