class Api::V1::SubscriptionController < ApplicationController
  def create
    new_sub = Subscription.create(sub_params)
    render json: SubscriptionSerializer.subscription(new_sub)
  end

  def update
    sub = Subscription.find(params[:sub_id])
    if sub.update(status: params[:status])
      render json: SubscriptionSerializer.subscription(sub)
    else
      render status: 404
    end
  end

  private

  def sub_params
    params.permit(:title, :price, :status, :frequency, :tea_id, :customer_id)
  end
end
