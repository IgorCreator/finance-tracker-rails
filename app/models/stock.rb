class Stock < ApplicationRecord

  def self.new_lookup(ticker_sym)
    # to look actual values
    # you should have file "master.key" that have been used during development
    # in console use command: EDITOR="subl --wait" rails credentials:edit
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:sandbox_publishable_token],
      secret_token: Rails.application.credentials.iex_client[:sandbox_secret_token],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    client.price(ticker_sym)
  end
end
