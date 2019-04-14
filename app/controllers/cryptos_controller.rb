
require 'twitter'
class CryptosController < ApplicationController
  
  def show
      tweets = Twitter::REST::Client.new do |config|
      config.consumer_key        = 'F9ljVNOFrEVqmDQ6Ho4gxTaMa' 
      config.consumer_secret     = 'MA2XgzTQvRkWTH5kTnOKMsVoQv6g7d1v3V2mM9ft9dW1LdjwE7'
    end
    @tweets = tweets.search('#cryptocurrencies').take(3)
  end


end
