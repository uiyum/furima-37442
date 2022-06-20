class Sell < ApplicationRecord
    validates :good_name, :text, :category_id, :condition_id, :postage_id, :prefecture_id, :delivery_id, :price, presence: true

    belongs_to :user
    has_one_attached :image

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category, :condition, :delivery, :postage, :prefecture
    validates :category_id, :condition_id, :delivery_id, :postage_id, :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}

end
