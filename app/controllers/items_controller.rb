class ItemsController < ApplicationController
  def index
    @items = Item.where(is_sale_status: true).page(params[:page]).per(12)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @item_tax_included_price = (@item.price * 1.1).floor
    @genres = Genre.all
    @member = Member.find(current_member.id)
    @cart_item = CartItem.new
  end

  def genre
    @genre = Genre.find(params[:genre_id])
    @genre_items = @genre.items.where(is_sale_status: true).page(params[:page]).per(12)
    @genres = Genre.all
  end

  # private
  # def cart_item_params
  #   params.require(:cart_item).permit(:quantity, :item_id, :member_id)
  # end
end
