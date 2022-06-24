class Sell < ApplicationRecord
    validates :good_name, :text, :category_id, :condition_id, :postage_id, :prefecture_id, :delivery_id, :price, presence: true

    belongs_to :user
    has_one_attached :image

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :postage
    belongs_to :prefecture
    belongs_to :delivery
    validates :category_id, :condition_id, :delivery_id, :postage_id, :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to:300,less_than_or_equal_to:9_999_999},presence: {message: "can't be blank"}

    validates :image, presence: true, unless: :was_attached?
    def was_attached?
        self.image.attached?
    end

end
