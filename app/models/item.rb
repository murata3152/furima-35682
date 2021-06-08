class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area, :category, :day, :postage, :status
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :item_name
    validates :details
    validates :image
    validates :price, numericality:  {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'is invalid'}
    with_options numericality: { other_than: 0 } do
      validates :area_id
      validates :category_id
      validates :day_id
      validates :postage_id
      validates :status_id
    end
  end

end
