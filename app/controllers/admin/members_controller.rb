class Admin::MembersController < ApplicationController
  def index
    @members = Member.all
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
      redirect_to member_path
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
