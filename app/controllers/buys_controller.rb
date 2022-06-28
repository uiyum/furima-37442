class BuysController < ApplicationController
    def index
        @sell = Sell.find(params[:sell_id])
    end

    def create
        @buy_address = BuyAddress.new(buy_params)
        if @buy_address.valid?
            @buy_address.save
            redireect_to root_path
        else
            render :index
        end
    end

    private
    def buy_params
        params.permit(:postal_code, :prefecture_id, :city, :house_number, :building, :telephone_number, :buy).merge(user_id: current_user.id)
    end
end
