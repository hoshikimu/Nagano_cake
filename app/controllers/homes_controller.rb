class HomesController < ApplicationController
  def top
    # Item.all ではなく 4つだけにしたい
    @items = Item.where(is_sale_status: true).order("RANDOM()").limit(4)
    @genres = Genre.all
  end

  def about
    
  end
end
