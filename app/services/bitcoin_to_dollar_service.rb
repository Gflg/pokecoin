# This class is responsible for retrieving the current bitcoin value in dollars
class BitcoinToDollarService
    def get_bitcoin_value_in_dollars
        response = conn.get("/ticker")
        parse_data(response)[:USD][:last]
    end

    private
    def conn
        Faraday.new("https://blockchain.info/")
    end

    def parse_data(response)
        JSON.parse(response.body, symbolize_names: true)
    end
end