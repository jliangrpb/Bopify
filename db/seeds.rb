# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'

  puts 'Destroying Tables...'
  Song.destroy_all
  Album.destroy_all
  Artist.destroy_all
  User.destroy_all

  puts "Resetting primary keys..."
    ApplicationRecord.connection.reset_pk_sequence!('users')
    ApplicationRecord.connection.reset_pk_sequence!('artists')
    ApplicationRecord.connection.reset_pk_sequence!('albums')
    ApplicationRecord.connection.reset_pk_sequence!('songs')

  puts 'Creating Users...'
  
  User.create!(
      username: 'demoman', 
      email: 'demo@demo.com', 
      password: 'password'
    )
  

  puts 'Creating Artists...'
  artist1 = Artist.create!(name: 'Zedd')
  artist2 = Artist.create!(name: 'Excision')

  puts 'Creating Albums...'
  album1 = Album.create!(name: 'Clarity', artist: artist1)
  song1 = Song.create!(name: 'Clarity', album: album1, runtime: '4:31')
  
  album2 = Album.create!(name: 'Onyx', artist: artist2)
  song2 = Song.create!(name: 'Decimate', album: album2, runtime: '3:41')
  song3 = Song.create!(name: 'Salvation', album: album2, runtime: '4:09')

  Album.where(id: 2)[0]
  album2_photo = URI.open('https://jamify-seeds.s3.amazonaws.com/onyx.jpg')
  album2.photo.attach(io: album2_photo, filename: "onyx.jpg")

  Song.where(id: 2).each_with_index do |song, index|
  song.photo.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/onyx.jpg"),
    filename: "onyx.jpg"
  )
  song.mp3.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/Decimate.mp3"),
    filename: "Decimate.mp3"
  )
  end