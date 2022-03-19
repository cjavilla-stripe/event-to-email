class EventMailer < ApplicationMailer
  def new_event(event, event_config)
    @event = event
    @event_config = event_config

    mail to: @event_config.email, subject: "New Stripe event: #{@event.type}"
  end
end
