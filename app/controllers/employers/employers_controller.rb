class Employers::EmployersController < ApplicationController
  layout "employers/employer"

  before_action :authenticate_user!
  before_action :current_ability
  load_and_authorize_resource
  before_action :load_company
end
