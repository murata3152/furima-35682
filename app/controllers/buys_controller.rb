class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_buy, only: [:index, :create, :correct_buy]
  before_action :correct_buy, only: [:index, :create]
  
  

  def index
    @buy_address = BuyAddress.new
  end

  def create 
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      pay_item
      @buy_address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  def correct_buy
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  private
  def buy_params
    params.require(:buy_address).permit(:postal_code, :municipality, :address, :phone_number, :building_name, :prefecture_id, :day_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: @buy_address.token,
      currency: 'jpy'
    )
  end

  def set_buy
    @item = Item.find(params[:item_id])
  end

end
