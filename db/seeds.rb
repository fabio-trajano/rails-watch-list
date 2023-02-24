# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)




# Bookmark.create(comment: "testing the bookmark 2", movie_id: 6, list_id: 1)
# puts "bookmark created"
# Bookmark.create(comment: "testing the bookmark 3", movie_id: 7, list_id: 2)
# puts "bookmark created"

url = "https://tmdb.lewagon.com/movie/top_rated"
movies_serialized = URI.open(url).read
movies_results = JSON.parse(movies_serialized)
movies = movies_results["results"]

movies.each do |movie|
  Movie.create(title: movie["original_title"], overview: movie["overview"], poster_url: movie["/6gIJuFHh5Lj4dNaPG3TzIMl7L68.jpg"], rating: movie["vote_average"].to_i)
  puts "movie created"
end
