# app/controllers/api/v1/subscriptions_controller.rb
module Api
  module V1
    class SubscriptionsController < ApplicationController
      before_action :authenticate_user!
      after_action :verify_authorized

      def index
        authorize Subscription
        subscriptions = SubscriptionFetcher.fetch_all_for_user(current_user.id)
        render json: subscriptions
      end

      def show
        authorize Subscription
        subscription = SubscriptionFetcher.fetch_one(params[:id])

        if subscription
          render json: subscription
        else
          render json: { error: 'Subscription not found' }, status: :not_found
        end
      end
    end
  end
end
