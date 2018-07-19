# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)require './app/models/merchant.rb'
require './app/models/artwork.rb'
require 'csv'

User.create(username: 'Chris', password: 'sfyack1', role: 1)

CSV.foreach('./data/public_art.csv', headers: true, header_converters: :symbol) do |art|
  Artwork.create(accession_date: art[:accession_date],
                year_installed: art[:year_installed],
                title: art[:title],
                artist: art[:artist],
                material: art[:material],
                location: art[:location],
                detailed_location: art[:detailed_location],
                notes: art[:notes],
                point_x: art[:point_x],
                point_y: art[:point_y],
                globalid: art[:globalid]
                )
end
