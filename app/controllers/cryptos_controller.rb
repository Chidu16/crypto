
require 'twitter'
require 'news-api'
class CryptosController < ApplicationController
  
  def show
      tweets = Twitter::REST::Client.new do |config|
      config.consumer_key        = 'F9ljVNOFrEVqmDQ6Ho4gxTaMa' 
      config.consumer_secret     = 'MA2XgzTQvRkWTH5kTnOKMsVoQv6g7d1v3V2mM9ft9dW1LdjwE7'
    end
    @tweets = tweets.search('#cryptocurrencies').take(3)
    
     newsapi = News.new("6554a6602f9f4517a27a73333a23ce95")
    @top_headlines = newsapi.get_top_headlines(q: 'bitcoin').take(3)
  end


end
