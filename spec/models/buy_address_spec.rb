require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    sell = FactoryBot.create(:sell)
    user = FactoryBot.create(:user)
    @buy_address = FactoryBot.build(:buy_address, user_id: user.id, sell_id: sell.id)
  end

describe '商品配送先' do
  context '内容に問題ない場合' do
  it '全て入力されていたら購入できる' do
    expect(@buy_address).to be_valid
  end
  it 'buildingは空でも保存できること' do
    @buy_address.building = ''
    expect(@buy_address).to be_valid
  end
end

context '入力に問題がある場合' do
  it "tokenが空では登録できないこと" do
    @buy_address.token = nil
    @buy_address.valid?
    expect(@buy_address.errors.full_messages).to include("Token can't be blank")
  end
  it 'postal_codeが空だと保存できないこと' do
    @buy_address.postal_code = ''
    @buy_address.valid?
    expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")
  end
  it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
    @buy_address.postal_code = '2345678'
    @buy_address.valid?
    expect(@buy_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
  end
  it 'prefecture_idを選択していないと保存できないこと' do
    @buy_address.prefecture_id = 1
    @buy_address.valid?
    expect(@buy_address.errors.full_messages).to include("Prefecture can't be blank")
  end
  it 'telephone_numberが空だと保存できないこと' do
    @buy_address.telephone_number = ''
    @buy_address.valid?
    expect(@buy_address.errors.full_messages).to include("Telephone number can't be blank")
  end
  it 'telephone_numberが半角のハイフンを含まない正しい形式でないと保存できないこと' do
    @buy_address.telephone_number = '090-1234-5678'
    @buy_address.valid?
    expect(@buy_address.errors.full_messages).to include('Telephone number is invalid. ハイフンを含まず、10桁以上11桁まで')
  end
  it 'telephone_numberが9桁以下では保存できないこと' do
    @buy_address.telephone_number = '090123456'
    @buy_address.valid?
    expect(@buy_address.errors.full_messages).to include('Telephone number is invalid. ハイフンを含まず、10桁以上11桁まで')
  end
  it 'telephone_numberが12桁以下では保存できないこと' do
    @buy_address.telephone_number = '090123456789'
    @buy_address.valid?
    expect(@buy_address.errors.full_messages).to include('Telephone number is invalid. ハイフンを含まず、10桁以上11桁まで')
  end
  it 'sellが紐付いていないと保存できないこと' do
    @buy_address.sell_id = nil
    @buy_address.valid?
    expect(@buy_address.errors.full_messages).to include("Sell can't be blank")
  end
  it 'userが紐付いていないと保存できないこと' do
    @buy_address.user_id = nil
    @buy_address.valid?
    expect(@buy_address.errors.full_messages).to include("User can't be blank")
  end
end

end
end


