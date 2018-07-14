# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)require './app/models/merchant.rb'
require './app/models/artwork.rb'
require 'csv'

CSV.foreach('./data/public_art.csv', headers: true, header_converters: :symbol) do |art|
  Artwork.create(title: art[:title],
                artist: art[:artist],
                material: art[:material],
                detailed
end
