# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# There are 898 pokemons with data that we need
service = PokemonService.new
1.upto(898) do |i|
    response = service.search_pokemon(i)
    data = {
        :id => i,
        :name => response[:name],
        :base_experience => response[:base_experience],
        :btc_price => response[:base_experience] * 0.00000001,
        :image_url => response[:sprites][:front_default]
    }
    pokemon = Pokemon.new(data)
    pokemon.save
    sleep(0.5)

    if i%100 == 0 then
        sleep(30)
    end
end
