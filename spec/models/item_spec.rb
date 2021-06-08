require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
  

    context '出品できる時' do
      it '全ての値が正しく入力されていれば出品できない' do
        expect(@item).to be_valid
      end
    end

    context '出品できない時' do
      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'detailsが空では出品できない' do
        @item.details = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Details can't be blank")
      end
      it 'status_idが0では出品できない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 0")
      end
      it 'postage_idが0では出品できない' do
        @item.postage_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage must be other than 0")
      end
      it 'area_idが0では出品できない' do
        @item.area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 0")
      end
      it 'day_idが0では出品できない' do
        @item.day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 0")
      end
      it 'category_idが0では出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'priceが299円以下では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'priceが10_000_000円以上では出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'priceは半角数字のみでないと出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'priceは半角英数字混合では出品できない' do
        @item.price = '3400en'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'priceは半角英字のみでは出品できない' do
        @item.price = 'sansenen'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'userが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end