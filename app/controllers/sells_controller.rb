class SellsController < ApplicationController
    before_action :authenticate_user!, except: [:index]
end

def index
    @sell = Sell.all
    #（応用）メッセージ機能を実装しよう、問題４使う？
end

def new
    @sell = Sell.new
end

def create
    @user = User.find(params[:user_id])
    @sell = @user.sells,new(sell_params)
    if @sell.save
        redirect_to root_path(@sell)#path後で見る
    else
        render :index
    end
end

private
def sell_params
    params.require(:sell).permit(:good_name, :image, :text).marge(user_id: current_user.id)
end