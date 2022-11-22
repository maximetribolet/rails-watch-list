# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "json"
require "open-uri"

puts "starting"

Movie.destroy_all

30.times do |number|

  url = "https://api.themoviedb.org/3/movie/top_rated?api_key=67398bb20877a3a8d66d2961b9ff2f3d&language=en-US&page=#{number + 1}"

  url_open = URI.open(url).read
  response = JSON.parse(url_open)

  response["results"].each do |movie|
    titles = movie["title"]
    overview = movie["overview"]
    poster_url = movie["poster_path"]
    rating = movie["vote_average"]

    p @movie = Movie.create!(title: titles, overview: overview, poster_url: poster_url, rating: rating)
  end
end

puts "Done"
