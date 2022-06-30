class BuyAddress
    include ActiveModel::Model
    attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building, :telephone_number, :user_id, :sell_id, :token
    validates :city, :house_number, presence: true
    validates :token, presence: true

    with_options presence: true do
        validates :sell_id
        validates :user_id
        validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
        validates :telephone_number, presence: true, format: {with: /\A\d{10,11}\z/, message: "is invalid. ハイフンを含まない"}
    end
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"} 

    def save
        buy = Buy.create(sell_id: sell_id, user_id: user_id)
        Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, telephone_number: telephone_number, buy_id: buy.id)
    end
end