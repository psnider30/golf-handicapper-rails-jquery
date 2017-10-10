class RegistrationsController < Devise::RegistrationsController

  private

  def golfer_params
    params.require(:golfer).permit(:name, :email, :password, :password_confirmation)
  end

  def sign_up_params
    golfer_params
  end

  def account_update_params
    golfer_params
  end
end
