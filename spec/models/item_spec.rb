require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
    @item = FactoryBot.build(:item)
    end
    context "出品できるとき" do
      it "全ての項目が正しく入力されていれば登録できること" do
        expect(@item).to be_valid
      end
    end
    context "出品できないとき" do
      it  "商品画像がないと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it "商品名が空だと出品できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("商品名を入力してください")
      end
      it  "商品説明がないと出品できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明を入力してください")
      end
      it  "商品の値段が決められていないと出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it "商品の値段は半角数字でなければ出品できない" do
        @item.price = 'gosenen'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end
      it "商品の値段は半角英数混合では出品できない" do
        @item.price = '123as'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end
      it "商品の値段は全角では出品できない" do
        @item.price = '５０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end
      it  "商品の値段が299円以下では出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300以上の値にしてください")
      end
      it "商品の値段が10,000,000以上では出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は9999999以下の値にしてください")
      end
      it "カテゴリが決められていなければ出品できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリidを入力してください")
      end
      it "カテゴリidが0以外でないと、出品できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリidは0以外の値にしてください")
      end
      it "商品の状態が分からなければ出品できない" do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品状態を入力してください")
      end
      it "状態idが0以外でないと出品できない" do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("商品状態は0以外の値にしてください")
      end
      it "発送日が決められていなければ出品できない" do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送日idを入力してください")
      end
      it "発送日idが0以外でないと出品できない" do
        @item.shipping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("発送日idは0以外の値にしてください")
      end
      it "発送元が決められていなければ出品できない" do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元（都道府県）idを入力してください")
      end
      it "発送元idが0以外でないと出品できない" do
        @item.shipping_area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元（都道府県）idは0以外の値にしてください")
      end
      it "送料込みか着払いか決められていなければ出品できない" do
        @item.shipping_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送負担金idを入力してください")
      end
      it "発送負担idが0以外でないと出品できない" do
        @item.shipping_cost_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("発送負担金idは0以外の値にしてください")
      end
    end
  end
end