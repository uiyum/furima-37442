class BuyAddress
    include ActiveModel::Model
    attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building, :telephone_number, :buy_id, :user_id, :sell_id

    with_options presence: true do
        validates :user_id, :buy_id
        validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    end
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

    def save
        Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, buy_id: buy.id)
    end
end