class BuysController < ApplicationController
    before_action :authenticate_user!

    def index
        @sell = Sell.find(params[:sell_id])
        @buy_address = BuyAddress.new
        if  current_user == @sell.user
            redirect_to root_path
        end
    end

    def create
        @sell = Sell.find(params[:sell_id])
        @buy_address = BuyAddress.new(buy_params)
        if @buy_address.valid?
           pay_item
           @buy_address.save
           return redirect_to root_path
        else
           render :index
        end
    end

    private
    def buy_params
        params.require(:buy_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :telephone_number).merge(user_id: current_user.id, token: params[:token], sell_id: params[:sell_id])
    end

    def pay_item
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
            amount: @sell.price,
            card: buy_params[:token],
            currency: 'jpy'
        )
    end
end
