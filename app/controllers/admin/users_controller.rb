class Admin::UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to(
        admin_dashboard_index_path,
        flash: { notice: 'Benutzer erfolgreich hinzugefügt' }
      )
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to(
        admin_dashboard_index_path,
        flash: { notice: 'Benutzer erfolgreich aktualisiert.' }
      )
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    authorize @user
    redirect_to admin_dashboard_index_path, notice: 'Benutzer erfolgreich gelöscht.'
  end

  private

  def user_params
    params.require(
      :user
    ).permit(
      :nickname,
      :email,
      :admin,
      :password,
      :password_confirmation,
    )
  end
end
