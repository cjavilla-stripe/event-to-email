class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    payload = request.body.read
    event = nil

    begin
      event = Stripe::Event.construct_from(
        JSON.parse(payload, symbolize_names: true)
      )
    rescue JSON::ParserError => e
      # Invalid payload
      status 400
      return
    end

    user = User.find_by(uid: event.account)
    event_configs = user.event_configs.where(event_type: event.type)
    event_configs.each do |config|
      puts "Send email to #{user.email} about #{event.type}"
      EventMailer.new_event(event, config).deliver_now
    end

    render json: { message: 'sent' }
  end
end
