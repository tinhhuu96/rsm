class Employers::AppliesController < Employers::EmployersController
  before_action :current_ability
  load_resource

  def update
    respond_to do |format|
      if @apply.update_attributes apply_params
        format.js{@message = t "employers.apply.updatess"}
      else
        format.js{@errors = t "employers.apply.updatefail"}
      end
    end
  end

  private

  def apply_params
    params.require(:apply).permit :status
  end

end
