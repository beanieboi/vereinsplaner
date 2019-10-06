class UsersController < ApplicationController
  def index
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to(
        users_path,
        flash: { notice: 'Profil erfolgreich aktualisiert.' }
      )
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(
      :user
    ).permit(
      :password,
      :password_confirmation,
    )
  end
end
