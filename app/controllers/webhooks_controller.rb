class WebhooksController < ApplicationController
	skip_before_action :verify_authenticity_token
	def create
	    payload = request.body.read
	    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
	    event = nil

	    begin
	    event = Stripe::Webhook.construct_event(
	      payload, sig_header, ENV['WEBHOOK']
	    )
	    rescue JSON::ParserError => e
	      status 400
	    return
	    rescue Stripe::SignatureVerificationError => e
	     Rails.logger.error "Stripe webhook signature verification failed: #{e.message}"
	      # render status: :unauthorized, json: { error: e.message }
	      puts "Signature error"
	      p e
	      return
	    end

	    # Handle the event
	    case event.type
	    when 'customer.created'
	      customer = event.data.object
	      @user = User.find_by(email: customer.email)
	      @user.update(stripe_id: customer.id)
	    when 'checkout.session.completed'
	      session = event.data.object
	      property = Property.find_by(id: session.metadata.property_id)
	      property.update(is_paid: true,status: 1)
	    end
	    render json: { message: 'success' }
  	end
end


