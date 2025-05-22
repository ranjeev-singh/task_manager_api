module Api
  module V1
    class EmailNotificationsController < ApplicationController
      def create
        email_notification = EmailNotification.new(email_notification_params)
        if email_notification.save
          EmailNotifier.notify(email_notification).deliver_later
          render json: { message: 'Email sent successfully' }, status: :ok
        else
          render json: { errors: email_notification.errors.full_messages }, status: :unprocessable_entity
        end
      end
     
      private
     
      def email_notification_params
        params.require(:email_notification).permit(:email, :subject, :body)
      end
    end
  end
end