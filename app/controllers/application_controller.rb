class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters,
   if: :devise_controller?
  
# ログイン後の遷移先を管理者と顧客で場合わけ
  def after_sign_in_path_for(resource)
      case resource
        when Admin
          admin_homes_top_path
        when Member
          root_path
      end
  end

# 新規会員登録後はhomes#topへ飛ぶように
  def after_sign_up_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
      case resource
        when :admin
          new_admin_session_path
        when :member
          root_path
      end
  end

  def destroy_all
    member = Member.find(params[:member_id])
    member.cart_items.destroy_all
  end

  protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])

    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name_family, :name_first, :name_family_kana, :name_first_kana, :email, :postal_code, :address, :phone_number, :password ])

  end
  
end
