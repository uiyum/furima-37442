require 'rails_helper'

RSpec.describe Sell, type: :model do
  before do
    @sell = FactoryBot.build(:sell)
  end

  describe '出品機能' do
    context '新規作成できる場合' do
      it "全ての値が存在すれば作成できる" do
        expect(@sell).to be_valid
      end
    end
    context '新規作成できない場合' do
      it "good_nameが空では作成できない" do
        @sell.good_name = ''
        @sell.valid?
        expect(@sell.errors.full_messages).to include("Good name can't be blank")
      end
      it "textが空では作成できない" do
        @sell.text = ''
        @sell.valid?
        expect(@sell.errors.full_messages).to include("Text can't be blank")
      end
      it 'categoryが未選択だと出品できない' do
        @sell.category_id = 1
        @sell.valid?
        expect(@sell.errors.full_messages).to include("Category can't be blank")
      end
      it 'conditionが未選択だと出品できない' do
        @sell.condition_id = 1
        @sell.valid?
        expect(@sell.errors.full_messages).to include("Condition can't be blank")
      end
      it 'postageが未選択だと出品できない' do
        @sell.postage_id = 1
        @sell.valid?
        expect(@sell.errors.full_messages).to include("Postage can't be blank")
      end
      it 'prefectureが未選択だと出品できない' do
        @sell.prefecture_id = 1
        @sell.valid?
        expect(@sell.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'deliveryが未選択だと出品できない' do
        @sell.delivery_id = 1
        @sell.valid?
        expect(@sell.errors.full_messages).to include("Delivery can't be blank")
      end
      it "priceが空では作成できない" do
        @sell.price = ''
        @sell.valid?
        expect(@sell.errors.full_messages).to include("Price can't be blank")
      end
      it "販売価格が300円より少ないのは登録できない" do
        @sell.price = 299
        @sell.valid?
        expect(@sell.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "販売価格が9,999,999円より多いのは登録できない" do
        @sell.price = 10_000_000
        @sell.valid?
        expect(@sell.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '販売価格に全角文字が含まれると登録できない' do
        @sell.price = '１111'
        @sell.valid?
        expect(@sell.errors.full_messages).to include("Price is not a number")
      end
      it 'imageが空では保存できない' do
        @sell.image = nil
        @sell.valid?
        expect(@sell.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @sell.user = nil
        @sell.valid?
        expect(@sell.errors.full_messages).to include('User must exist')
      end

    end
  end
end

