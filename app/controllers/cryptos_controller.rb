
require 'twitter'
require 'news-api'
class CryptosController < ApplicationController
  
  def show
      tweets = Twitter::REST::Client.new do |config|
      config.consumer_key        = 'Twitter Key' 
      config.consumer_secret     = 'Twitter Secret'
    end
    @tweets = tweets.search('#cryptocurrencies').take(5)
    
     newsapi = News.new("News API Key")
    @top_headlines = newsapi.get_top_headlines(q: 'bitcoin').take(6)
  end


end
