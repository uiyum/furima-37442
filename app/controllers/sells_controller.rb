class SellsController < ApplicationController
    before_action :authenticate_user!, except: [:index]
end
