class Employers::AppliesController < Employers::EmployersController

  def update
    respond_to do |format|
      if @apply.update_attributes apply_params
        @appointment = @apply.appointment
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
