class ItemsController < ApplicationController
  def index
    @items = Item.all
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @item_tax_included_price = (@item.price * 1.1).floor
    @genres = Genre.all
  end
end
