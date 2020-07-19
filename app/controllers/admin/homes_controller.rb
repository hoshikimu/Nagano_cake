class Admin::HomesController < ApplicationController
  def top
    @order_items = OrderItem.all
  end
end
