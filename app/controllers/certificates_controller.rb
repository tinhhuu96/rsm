class CertificatesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource param_method: :params_certificate

  def create
    respond_to do |format|
      if @certificate.save
        format.js{@message = t "certificate.success"}
      else
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @certificate.update_attributes params_certificate
        format.js{@message = t "certificate.success"}
      else
        format.js
      end
    end
  end

  def destroy
    respond_to do |format|
      if @certificate.destroy
        format.js{@message_success = t "certificate.success"}
      else
        format.js{@message_failed = t "certificate.fail"}
      end
    end
  end

  private

  def params_certificate
    params.require(:certificate).permit :name, :majors, :organization, :classification, :received_time, :user_id
  end

end
