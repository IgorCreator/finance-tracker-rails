class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  validates :name, :ticker, presence: true

  def self.new_lookup(ticker_sym)
    # to look actual values
    # you should have file "master.key" that have been used during development
    # in console use command: EDITOR="subl --wait" rails credentials:edit
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:sandbox_publishable_token],
      secret_token: Rails.application.credentials.iex_client[:sandbox_secret_token],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    begin
      new(ticker: ticker_sym,
          name: client.company(ticker_sym).company_name,
          last_price: client.price(ticker_sym))
    rescue => ex
      return nil
    end
  end

  def self.check_db(symbol)
    where(ticker: symbol).first
  end
end
