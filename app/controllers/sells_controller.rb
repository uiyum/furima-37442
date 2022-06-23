class SellsController < ApplicationController
    before_action :authenticate_user!, except: [:index]

    def index
        #@sell = Sell.all
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

    private
    def sell_params
        params.require(:sell).permit(:good_name, :image, :text, :category_id, :condition_id,:delivery_id, :postage_id, :prefecture_id, :price).merge(user_id: current_user.id)
    end
   
end
