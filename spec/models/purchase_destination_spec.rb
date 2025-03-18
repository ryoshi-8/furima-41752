require 'rails_helper'

RSpec.describe PurchaseDestination, type: :model do
  before do
    item = FactoryBot.create(:item)
    @purchase_destination = FactoryBot.build(:purchase_destination, user_id: item.user_id, item_id: item.id)
    sleep(0.1)
  end

  describe '商品の購入' do
    context '商品の購入ができる場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@purchase_destination).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @purchase_destination.building = ''
        expect(@purchase_destination).to be_valid
      end
    end
    context '商品の購入ができない場合' do
      it 'postcodeが空だと購入できない' do
        @purchase_destination.postcode = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeにハイフンが無いと購入できない' do
        @purchase_destination.postcode = '1234567'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Postcode is invalid.')
      end
      it 'postcodeの桁数が多いと購入できない' do
        @purchase_destination.postcode = '1234-5678'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Postcode is invalid.')
      end
      it 'postcodeの桁数が少ないと購入できない' do
        @purchase_destination.postcode = '123-456'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Postcode is invalid.')
      end
      it 'postcodeが全角文字列では購入できない' do
        @purchase_destination.postcode = '１２３−４５６７'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Postcode is invalid.')
      end
      it 'prefecture_idが1では購入できない' do
        @purchase_destination.prefecture_id = '1'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと購入できない' do
        @purchase_destination.city = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと購入できない' do
        @purchase_destination.block = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @purchase_destination.phone_number = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberにハイフンがあると購入できない' do
        @purchase_destination.phone_number = '090-1234-5678'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'phone_numberが9桁以下では購入できない' do
        @purchase_destination.phone_number = '090123456'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'phone_numberが12桁以上では購入できない' do
        @purchase_destination.phone_number = '090123456789'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'userが紐付いていないと購入できない' do
        @purchase_destination.user_id = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと購入できない' do
        @purchase_destination.item_id = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では購入できない' do
        @purchase_destination.token = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
