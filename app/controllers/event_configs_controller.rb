class EventConfigsController < ApplicationController
  def index
    @event_configs = current_user.event_configs.all
  end

  def new
  end

  def create
    @event_config = current_user.event_configs.new(event_config_params)
    if @event_config.save
      redirect_to event_configs_path
    else
      render :new
    end
  end

  private

  def event_config_params
    params.require(:event_config).permit(:email, :event_type)
  end
end
