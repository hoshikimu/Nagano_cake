class MembersController < ApplicationController

  before_action :authenticate_member!
  before_action :current_member?, except: :withdrawal

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
       redirect_to member_path(@member)
    else
       render :edit
    end
  end

  def withdrawal
  end

  def hide
    @member = Member.find(params[:id])
    @member.update(is_withdrawal_flag: false)
    reset_session
    redirect_to root_path
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
      :email
    )
  end

end