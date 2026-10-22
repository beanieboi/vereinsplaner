# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    def new
      @user = User.new
      authorize @user
    end

    def edit
      @user = User.find(params[:id])
      authorize @user
    end

    def show
      @user = User.find(params[:id])
    end

    def create
      @user = User.new
      authorize @user
      @user.assign_attributes(user_params)

      if @user.save
        redirect_to(
          admin_dashboard_index_path,
          flash: { notice: "Benutzer erfolgreich hinzugefügt" }
        )
      else
        render "new"
      end
    end

    def update
      @user = User.find(params[:id])
      authorize @user

      if @user.update(user_params)
        redirect_to(
          admin_dashboard_index_path,
          flash: { notice: "Benutzer erfolgreich aktualisiert." }
        )
      else
        render "new"
      end
    end

    def destroy
      @user = User.find(params[:id])
      authorize @user
      @user.destroy
      redirect_to admin_dashboard_index_path, notice: "Benutzer erfolgreich gelöscht."
    end

    private

    def user_params
      attrs = params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
      attrs[:admin] = params[:user][:admin] if current_user.admin? && params[:user].key?(:admin)
      attrs
    end
  end
end
