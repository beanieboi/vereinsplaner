class MembersController < ApplicationController
  def index
    @members = Member.order(:last_name).order(:first_name).all
  end

  def new
    @member = Member.new
    # set some defaults
    @member.membership_fee_in_euro = 45
    @member.member_since = Date.today
    @member.member_since = Date.today
    @member.membership_type = MembershipType.full.first
  end

  def edit
    @member = Member.find(params[:id])
  end

  def show
    @member = Member.find(params[:id])
  end

  def create
    @member = Member.new(member_params)

    if @member.save
      redirect_to(
        members_path,
        flash: { notice: 'Mitglied erfolgreich hinzugefügt' }
      )
    else
      render 'new'
    end
  end

  def update
    @member = Member.find(params[:id])

    unless member_params.key?(:tags)
      @member.tags = []
    end

    if @member.update(member_params)
      redirect_to(
        members_path,
        flash: { notice: 'Mitglied erfolgreich aktualisiert.' }
      )
    else
      render 'new'
    end
  end

  def destroy
    @member = Member.find(params[:id])
    authorize @member
    redirect_to members_path, notice: 'Mitglieder erfolgreich gelöscht.'
  end

  private

  def member_params
    params.require(
      :member
    ).permit(
      :first_name,
      :last_name,
      :date_of_birth,
      :gender,
      :street,
      :street_number,
      :postal_code,
      :city,
      :country,
      :contact_email,
      :contact_phone,
      :membership_fee_in_euro,
      :membership_type_id,
      :member_since,
      :application_form,
      :sepa_mandate,
      :comment,
      :tags => [],
    )
  end
end
