class Admin::ItemsController < ApplicationController
  def new
    @item_new = Item.new
  end

  def create
    @item_new = Item.new(list_params)
    @item_new.save
    redirect_to admin_item_path(@item_new)
  end

  def index
    @items = Item.all
  end

  def show
    
  end

  def edit
    
  end

  def update
    
  end

  private
  def list_params
    params.require(:item).permit(:genre_id, :name, :introduction, :image, :price, :is_sale_status)
  end
end
