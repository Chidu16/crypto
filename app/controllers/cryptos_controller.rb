
require 'twitter'
class CryptosController < ApplicationController
  
  def show
      tweets = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV.fetch("TWITTER_KEY")
      config.consumer_secret     = ENV.fetch("TWITTER_SECRET")
    end
    @tweets = tweets.search('#cryptocurrencies').take(3)
  end


end
