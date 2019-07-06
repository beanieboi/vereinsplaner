class PaymentsController < ApplicationController
  def index
    @payments = Payment.all
  end

  def new
    @payment = Payment.new
    @payment.payed_at = Date.today
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.created_by = current_user

    if @payment.save
      redirect_to(
        payments_path,
        flash: { notice: 'Zahlung erfolgreich hinzugefügt' }
      )
    else
      render 'new'
    end
  end

  def update
    @payment = Payment.find(params[:id])

    if @payment.update(payment_params)
      redirect_to(
        payments_path,
        flash: { notice: 'Zahlung erfolgreich aktualisiert.' }
      )
    else
      render 'new'
    end
  end

  def destroy
    @payment = Payment.find(params[:id])
    if @payment.destroy
      redirect_to payments_path, notice: 'Zahlung erfolgreich gelöscht.'
    else
      redirect_to payments_path, notice: 'Zahlung konnte nicht gelöscht werden.'
    end
  end

  private

  def payment_params
    params.require(
      :payment
    ).permit(
      :member_id,
      :amount,
      :payed_at
    )
  end
end
