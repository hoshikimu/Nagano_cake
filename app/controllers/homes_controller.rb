class HomesController < ApplicationController
  def top
    @items = Item.limit(4)
    @genres = Genre.all
  end

  def about
    
  end
end
