class Admin::MembersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @members = Member.page(params[:page])
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to admin_members_path
    else
      @member= Member.find(params[:id])
      render :edit
    end
  end

private

def member_params
  params.require(:member).permit(
    :name_family, 
    :name_first, 
    :name_family_kana, 
    :name_first_kana,
    :postal_code,
    :address,
    :phone_number,
    :email,
    :is_withdrawal_flag
  )
end

end
