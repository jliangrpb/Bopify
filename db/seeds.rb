# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do 
  puts 'Destroying Tables...'
    User.destroy_all
    Song.destroy_all
    Album.destroy_all
    Artist.destroy_all

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
  song2 = Song.create!(name: 'Decimate', album: album2)
  song3 = Song.create!(name: 'Salvation', album: album2)

end
