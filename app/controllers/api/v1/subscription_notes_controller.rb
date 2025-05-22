module Api
  module V1
    class SubscriptionNotesController < ApplicationController
      before_action :authenticate_user!

      def create
        note = SubscriptionNote.create!(
          subscription_id: params[:subscription_id],
          user: current_user,
          content: params[:content]
        )
        render json: note, status: :created
      end
    end
  end
end
