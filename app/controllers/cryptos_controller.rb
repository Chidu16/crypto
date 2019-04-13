require "#{Rails.root}/lib/cryptos/crypto_client.rb"

class CryptosController < ApplicationController
  
  def show
    @cryptos = params[:id] ? params[:id].downcase : ''
    case @cryptos
    when  !Crypto.curr_typs.include?(@cryptos) 
      @cryptos = {}
    else
      @cryptos = set_cryptos(@cryptos)
    end
  end

private

  def set_cryptos(curr_typ)
    @cryptos = Crypto.where(curr_typ: Crypto.curr_typs["#{curr_typ}"])
    @cryptos.inject({}) do |new_element, current_element|
      date = current_element.date
      value = current_element.val
      new_element[date] = value
      new_element
    end
  end
end