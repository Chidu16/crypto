module CryptoClient
  
  def self.get_bitcoins
    
    json_response = get_json_response('https://api.coindesk.com/v1/bpi/currentprice.json')
     value = json_response['bpi']['USD']['rate']
     value
  end

  def self.get_ethereums
    json_response = get_json_response('https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=USD,JPY,EUR')
    value = json_response['USD']
     value
  end
  
  def self.get_ripples
    json_response = get_json_response('https://min-api.cryptocompare.com/data/price?fsym=XRP&tsyms=USD,JPY,EUR')
    value = json_response['USD']
     value
  end

#   def self.get_nasdaqs
#     json = get_json_response(APP_CONFIG.fetch('nasdaq_api_url'))
#     values = json['seriess'].first['obs']
#     values.inject({}) do |new_element, current_element|
#       key = DateTime.strptime((current_element[0] / 1000).to_s, '%s')
#       value = current_element[1]
#       new_element[key] = value
#       new_element
#     end
#   end

 private

#   def self.get_currencies(api_url)
#     json_response = get_json_response(api_url)
#     value = json_response['bpi']['USD']['rate']
#     value
#   end

  def self.get_json_response(api_url)
    response = RestClient.get(api_url)
    json = JSON.parse(response)
    json
  end
end