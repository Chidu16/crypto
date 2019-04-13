require "cryptos/crypto_client"

namespace :dev do
  desc "Insert all crypto currencies in the database"
  task seed: "db:seed" do
    include CryptoClient

    begin
      bitcoins = CryptoClient.get_bitcoins
      ethereums = CryptoClient.get_ethereums
      ripples = CryptoClient.get_ripples

      insert_cryptos('bitcoin', bitcoins)
      insert_cryptos('ethereum', ethereums)
      insert_cryptos('ripple', ripples)

      puts " crypto currencies inserted!"
      
      
    rescue ActiveRecord::StatementInvalid

    end
  end
end


def insert_cryptos(type, cryptos)
  cryptos.each do |date, value|
    ActiveRecord::Base.transaction do
      Crypto.create(curr_typ: type, date: date, val: value)
      print_crypto(type.capitalize, date, value)
    end
  end    
end

def print_crypto(currency, date, value)
  puts "#{currency}'s value on #{date}: #{value} USD"
end