class SendEmailJob < ApplicationJob
  queue_as :default

  def perform user
    @user = user
    CompanyMailer.send_member(@user).deliver_later
  end
end
