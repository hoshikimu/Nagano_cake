class HomesController < ApplicationController
  def top
    # Item.all ではなく 4つだけにしたい
    @items = Item.where(is_sale_status: true).order("RANDOM()").limit(4)
    @genres = Genre.all
  end

  def about
    
  end

  def redirect
    @id = params[:member_id]  #redirect前に入力された値
  end

  def contact_form

  end

end
