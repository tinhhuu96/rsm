class SendEmailUserJob < ApplicationJob
  queue_as :default

  def perform user
    @user = user
    CompanyMailer.approved_user(@user).deliver_later
  end
end
