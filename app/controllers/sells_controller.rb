class SellsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_sell, only: [:show, :edit, :update, :destroy]

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
    end

    def edit
        if @sell.user_id != current_user.id || @sell.buy != nil
            redirect_to root_path
        end

    end

    def update
        if @sell.update(sell_params)
            redirect_to sell_path
        else
            render :edit
        end
    end

    def destroy
        @sell.destroy if current_user.id == @sell.user_id
        redirect_to root_path

    end

    private
    def sell_params
        params.require(:sell).permit(:good_name, :image, :text, :category_id, :condition_id,:delivery_id, :postage_id, :prefecture_id, :price).merge(user_id: current_user.id)
    end

    def set_sell
        @sell = Sell.find(params[:id])
    end
   
end
