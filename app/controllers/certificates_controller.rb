class CertificatesController < ApplicationController
  before_action :load_certificate, only: %i(edit update destroy)

  def new
    @certificate = Certificate.new
  end

  def create
    @certificate = Certificate.new params_certificate
    respond_to do |format|
      if @certificate.save
        format.js{flash[:success] = t "certificate.success"}
      else
        format.js{flash[:danger] = t "certificate.fail"}
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @certificate.update_attributes params_certificate
        format.js{flash[:success] = t "certificate.success"}
      else
        format.js{flash[:danger] = t "certificate.fail"}
      end
    end
  end

  def destroy
    respond_to do |format|
      if @certificate.destroy
        format.js{flash[:success] = t "certificate.success"}
      else
        format.js{flash[:danger] = t "certificate.fail"}
      end
    end
  end

  private

  def params_certificate
    params.require(:certificate).permit :name, :majors, :organization, :classification, :received_time, :user_id
  end

  def load_certificate
    @certificate = Certificate.find_by id: params[:id]
    return if @certificate
    flash[:warning] = t "certificate.fail"
    redirect_to user_path
  end
end
