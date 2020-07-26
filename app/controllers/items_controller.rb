class ItemsController < ApplicationController
  def index
    @items = Item.where(is_sale_status: true).page(params[:page]).per(12)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @item_tax_included_price = (@item.price * 1.1).floor
    @genres = Genre.all
    if member_signed_in?
      @member = Member.find(current_member.id)
    end
    @cart_item = CartItem.new
  end



  def genre
    @genre = Genre.find(params[:genre_id])
    @genre_items = @genre.items.where(is_sale_status: true).page(params[:page]).per(12)
    @genres = Genre.all
  end

end