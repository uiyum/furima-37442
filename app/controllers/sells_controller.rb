class SellsController < ApplicationController
    before_action :authenticate_user!, except: [:index]
end

def index
    @sells = Sell.all
end

def new
    @sell = Sell.new
end