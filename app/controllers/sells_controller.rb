class SellsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @sells = Sell.all.order(created_at: :desc)
    end

    def new
        @sell = Sell.new
    end

    def create
        @sell = Sell.new(sell_params)
        if  @sell.save
            redirect_to root_path
        else
            render new_sell_path
        end
    end

    def show
        @sell = Sell.find(params[:id])
    end

    private
    def sell_params
        params.require(:sell).permit(:good_name, :image, :text, :category_id, :condition_id,:delivery_id, :postage_id, :prefecture_id, :price).merge(user_id: current_user.id)
    end
   
end
