class PaymentController < ApplicationController
  require 'json'
  require 'sinatra'
  require 'stripe'
  def new 
  end
  def create
    @property = Property.find(params[:property_id])
    product = Stripe::Product.create({
      name: @property.name,
    })
    price = Stripe::Price.create({
      product: product.id,
      unit_amount: @property.price * 100,
      currency: 'inr',
    })

    @session = Stripe::Checkout::Session.create({
      customer: current_user.stripe_id,
      success_url: "http://localhost:3000/checkout/success?session_id={CHECKOUT_SESSION_ID}" ,
      cancel_url: 'http://localhost:3000/',
      client_reference_id: current_user.id,
      payment_method_types: ['card'],

      line_items: [{
          price: price.id,
          quantity: 1
      }],
      mode: 'payment',
      metadata: {property_id: params[:property_id]},
      invoice_creation: {
        enabled: true,
        invoice_data: {
          description: 'Invoice for ' + @property.name,
          metadata: {property_name: @property.name,property_price: @property.price},
          footer: 'RentalProperty Inc.',
        },
      },

    })
    redirect_to @session.url,status: 303,allow_other_host: true 
  end

  def success
    @checkout_session = Stripe::Checkout::Session.retrieve({ id: params[:session_id]})
    invoice = Stripe::Invoice.retrieve(@checkout_session.invoice)
    # property = Property.find(@checkout_session.metadata.property_id)
    if @checkout_session.payment_status == "paid"
      payment_details = PaymentDetail.new(payment_id: @checkout_session.id, user_id: @checkout_session.client_reference_id,property_id:@checkout_session.metadata.property_id,payment_status: @checkout_session.payment_status, total_amount: @checkout_session.amount_total)
      payment_details.save
      # current_user.update(stripe_id: customer.id)
      # property.update(is_paid: true,status: 1)

    end
    redirect_to invoice.hosted_invoice_url,status: 303,allow_other_host: true 
  end
end
