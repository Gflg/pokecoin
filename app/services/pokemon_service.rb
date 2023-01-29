class PokemonService
    def search_pokemon(pokemon_id)
        response = conn.get("/api/v2/pokemon/#{pokemon_id}/")
        parse_data(response)
    end

    private
    def conn
        Faraday.new("https://pokeapi.co")
    end

    def parse_data(response)
        JSON.parse(response.body, symbolize_names: true)
    end
end