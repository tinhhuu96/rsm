class Employers::AppointmentsController < ApplicationController
  load_and_authorize_resource param_method: :user_params

  def create
    respond_to do |format|
      if @appointment.save
        CompanyMailer.approved_user(@appointment).deliver_now
        create_inforappointments if params[:states].present?
        format.js{@message = t "appointment.create_success"}
      else
        @apply = @appointment.apply
        @members = @appointment.company.members
        format.js
      end
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit :user_id, :address, :company_id, :start_time, :end_time, :apply_id
  end

  def create_inforappointments
    @item = params[:states]
    inforappointments = []
    @item.each do |user_id|
      next if user_id.blank?
      inforappointments << Inforappointment.new(user_id: user_id, appointment_id: @appointment.id)
    end
    Inforappointment.import inforappointments
    CompanyMailer.send_member(@appointment).deliver_now
  end
end
