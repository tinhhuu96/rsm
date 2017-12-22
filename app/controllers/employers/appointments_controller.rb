class Employers::AppointmentsController < ApplicationController
  load_and_authorize_resource param_method: :user_params

  def create
    respond_to do |format|
      @apply = @appointment.apply
      if @appointment.save
        SendEmailUserJob.perform_later(@appointment)
        create_inforappointments if params[:states].present?
        format.js{@message = t "appointment.create_success"}
      else
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
      info_appointment = Inforappointment.new(user_id: user_id, appointment_id: @appointment.id)
      info_appointment.create_activation_digest
      inforappointments << info_appointment
    end
    Inforappointment.import inforappointments
    @appointment.inforappointments.each do |member|
      SendEmailJob.perform_later(member)
    end
  end
end
