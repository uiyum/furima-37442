class Sell < ApplicationRecord
    validates :good_name, :text, :category_id, :condition_id, :postage_id, :prefecture_id, :delivery_id, :price, presence: true

    belongs_to :user
    has_one_attached :image

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category, :condition, :delivery, :postage, :prefecture
    validates :category_id, :condition_id, :delivery_id, :postage_id, :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}

    with_options presence: true, format: { with: /\A[0-9]+\z/ } do
        validates :price, numericality: {only_integer: true, greater_than_or_equal_to:300,less_than_or_equal_to:9_999_999},
        presence: {message: "can't be blank"}
    end

end
