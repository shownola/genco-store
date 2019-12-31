class ChargesController < ApplicationController
rescue_from Stripe::CardError, with: :catch_exception

  def new
  end

  def create
    StripeChargesServices.new(charges_params, current_user).call
    redirect_to new_charge_path
  end

  private

    def charges_params
      params.permit(:stripeEmail, :stripeToken, :order_id)
    end

    def catch_exception(exception)
      flash[:error] = exception.message
    end

end


# Token is created using Checkout or Elements!
# Get the payment token ID submitted by the form:
# token = params[:stripeToken]
#
# charge = Stripe::Charge.create({
#     amount: 999,
#     currency: 'usd',
#     description: 'Example charge',
#     source: token,
# })
