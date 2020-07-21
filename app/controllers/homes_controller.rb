class HomesController < ApplicationController
  def top
    # Item.all ではなく 4つだけにしたい
    @items = Item.order("RANDOM()").limit(4)
    @genres = Genre.all
  end

  def about
    
  end
end
