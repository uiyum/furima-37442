class SellsController < ApplicationController
    before_action :authenticate_user!, except: [:index]
end

def index
    @sells = Sell.all
end

def new
    @sell = Sell.new
end

def create
    Sell.create(sell_params)
end

private
def sell_params
    params.require(:sell).permit(:good_name, :image, :text)