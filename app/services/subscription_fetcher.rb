class SubscriptionFetcher
  include HTTParty
  base_uri ENV['APP1_API_URL']

  def self.fetch_all_for_user(user_id)
    response = get("/api/v1/users/#{user_id}/subscriptions")
    response.success? ? response.parsed_response : []
  end

  def self.fetch_one(external_id)
    response = get("/api/v1/subscriptions/#{external_id}")
    response.success? ? response.parsed_response : nil
  end
end
