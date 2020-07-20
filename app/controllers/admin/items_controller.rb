class Admin::ItemsController < ApplicationController
  def new
    @item_new = Item.new
    @items = Item.all
  end

  def create
    @item_new = Item.new(item_params)
    @item_new.save
    redirect_to admin_item_path(@item_new)
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @item_tax_included_price = (@item.price * 1.1).floor

  end

  def edit
    @item = Item.find(params[:id])

  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :image, :price, :is_sale_status)
  end
end
