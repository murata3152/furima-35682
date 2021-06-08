require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
  

    context '保存できる時' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@item).to be_valid
      end
    end

    context '保存できない時' do
      it 'item_nameが空では保存できないこと' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'priceが空では保存できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'detailsが空では保存できないこと' do
        @item.details = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Details can't be blank")
      end
      it 'status_idが0では保存できないこと' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 0")
      end
      it 'postage_idが0では保存できないこと' do
        @item.postage_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage must be other than 0")
      end
      it 'area_idが0では保存できないこと' do
        @item.area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 0")
      end
      it 'day_idが0では保存できないこと' do
        @item.day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 0")
      end
      it 'category_idが0では保存できないこと' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it 'imageが空では保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'priceが300~9999999の間でないと保存できないこと' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'priceは半角数字のみでないと保存できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end