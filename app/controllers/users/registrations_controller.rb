class Users::RegistrationsController < Devise::RegistrationsController

  before_action :configure_permitted_parameters, if: :devise_controller?

  # GET /users/sign_up
  def new

    # Override Devise default behaviour and create a profile as well
    build_resource({})
    resource.build_agent
    respond_with self.resource
  end

  def create
    super
    if agent_params
      @agent = Agent.new(agent_params)
      @agent.user = resource
      @agent.save
    end
  end

  protected

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :agent_attributes])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def agent_params
    params.require(:user).permit(agent_attributes: {})[:agent_attributes]
  end
end
