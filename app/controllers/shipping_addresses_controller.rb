class ShippingAddressesController < ApplicationController
  def index
    @shipping = ShippingAddress.new
    @shippings = ShippingAddress.all
    @member = Member.find(params[:member_id])
  end

  def edit
    @shipping = ShippingAddress.find(params[:id])
    @shippings = ShippingAddress.all
    @member = Member.find(params[:member_id])
  end

  def create
    @member = Member.find(params[:member_id])
    @shipping = ShippingAddress.new(shipping_params)
    @shipping.member_id = current_member.id
    @shipping.save
    redirect_to member_shipping_addresses_path
  end

  def update
    @member = Member.find(params[:member_id])
    @shipping = ShippingAddress.find(params[:id])
    ShippingAddress.find_by(id: params[:id], member_id: params[:member_id]).update(shipping_params)
    redirect_to member_shipping_addresses_path
  end

  def destroy
    ShippingAddress.find_by(id: params[:id], member_id: params[:member_id]).destroy
    redirect_to member_shipping_addresses_path
  end

  private
  def shipping_params
    params.require(:shipping_address).permit(:postal_code, :address, :receiver)
  end

end
