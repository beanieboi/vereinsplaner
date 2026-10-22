# frozen_string_literal: true

module Admin
  class UsersController < BaseController
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
      authorize @user
    end

    def create
      @user = User.new
      authorize @user
      @user.assign_attributes(permitted_attributes(@user))

      if @user.save
        redirect_to(
          admin_dashboard_index_path,
          flash: { notice: "Benutzer erfolgreich hinzugefügt" }
        )
      else
        render "new", status: :unprocessable_content
      end
    end

    def update
      @user = User.find(params[:id])
      authorize @user

      if @user.update(permitted_attributes(@user))
        redirect_to(
          admin_dashboard_index_path,
          flash: { notice: "Benutzer erfolgreich aktualisiert." }
        )
      else
        render "edit", status: :unprocessable_content
      end
    end

    def destroy
      @user = User.find(params[:id])
      authorize @user
      @user.destroy
      redirect_to admin_dashboard_index_path, notice: "Benutzer erfolgreich gelöscht."
    end
  end
end
