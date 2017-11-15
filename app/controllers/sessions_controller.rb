class SessionsController < Devise::SessionsController
  layout "information"
  before_action :pre_login_url, only: %i(new create destroy)

  def new
    super
  end

  def create
    super
  end

  def destroy
    super
  end

  private

  def pre_login_url
    @referer_url = root_path
  end

  def after_sign_in_path_for resource
    sign_in_url = url_for(action: :new, controller: :sessions, only_path: false, protocol: :http)
    if @referer_url == sign_in_url
      super
    else
      @referer_url || root_path
    end
  end
end
