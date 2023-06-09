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
  artist3 = Artist.create!(name: 'Illenium')
  artist4 = Artist.create!(name: 'Martin Garrix')
  artist5 = Artist.create!(name: 'Sullivan King')
  artist6 = Artist.create!(name: 'Subtronics')
  artist7 = Artist.create!(name: 'SLANDER')

  puts 'Creating Albums...'
  album1 = Album.create!(name: 'Clarity', artist: artist1)
  song1 = Song.create!(name: 'Clarity', album: album1, runtime: '4:32')
  song2 = Song.create!(name: 'Stay The Night', album: album1, runtime: '3:37')

  Album.where(id: 1)[0]
  album1_photo = URI.open('https://jamify-seeds.s3.amazonaws.com/Clarity.jpg')
  album1.photo.attach(io: album1_photo, filename: "Clarity.jpg")

  Song.where(id: 1).each_with_index do |song, index|
  song.mp3.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/clarity.mp3"),
    filename: "clarity.mp3"
  )
  end
  Song.where(id: 2).each_with_index do |song, index|
  song.mp3.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/stay-the-night.mp3"),
    filename: "stay-the-night.mp3"
  )
  end

  album2 = Album.create!(name: 'True Colors', artist: artist1)
  song3 = Song.create!(name: 'I Want You To Know', album: album2, runtime: '3:59')
  song4 = Song.create!(name: 'Beautiful Now', album: album2, runtime: '3:39')

  Album.where(id: 2)[0]
  album2_photo = URI.open('https://jamify-seeds.s3.amazonaws.com/true-colors.jpeg')
  album2.photo.attach(io: album2_photo, filename: "true-colors.jpg")

  Song.where(id: 3).each_with_index do |song, index|
  song.mp3.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/i-want-you-to-know.mp3"),
    filename: "i-want-you-to-know.mp3"
  )
  end
  Song.where(id: 4).each_with_index do |song, index|
  song.mp3.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/beautiful-now.mp3"),
    filename: "beautiful-now.mp3"
  )
  end
  
  album3 = Album.create!(name: 'Onyx', artist: artist2)
  song5 = Song.create!(name: 'Decimate', album: album3, runtime: '3:42')
  song6 = Song.create!(name: 'Salvation', album: album3, runtime: '4:10')

  Album.where(id: 3)[0]
  album3_photo = URI.open('https://jamify-seeds.s3.amazonaws.com/onyx.jpg')
  album3.photo.attach(io: album3_photo, filename: "onyx.jpg")

  Song.where(id: 5).each_with_index do |song, index|
  song.mp3.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/Decimate.mp3"),
    filename: "Decimate.mp3"
  )
  end
  Song.where(id: 6).each_with_index do |song, index|
  song.mp3.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/salvation.mp3"),
    filename: "salvation.mp3"
  )
  end

  album4 = Album.create!(name: 'ASCEND', artist: artist3)
  song7 = Song.create!(name: 'Good Things Fall Apart', album: album4, runtime: '3:37')
  song8 = Song.create!(name: 'In Your Arms', album: album4, runtime: '3:41')
  song9 = Song.create!(name: 'Gorgeous', album: album4, runtime: '4:38')

  Album.where(id: 4)[0]
  album4_photo = URI.open('https://jamify-seeds.s3.amazonaws.com/ascend.jpeg')
  album4.photo.attach(io: album4_photo, filename: "ascend.jpg")

  Song.where(id: 7).each_with_index do |song, index|
  song.mp3.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/good-things.mp3"),
    filename: "good-things.mp3"
  )
  end
  Song.where(id: 8).each_with_index do |song, index|
  song.mp3.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/in-your-arms.mp3"),
    filename: "in-your-arms.mp3"
  )
  end
  Song.where(id: 9).each_with_index do |song, index|
  song.mp3.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/gorgeous.mp3"),
    filename: "gorgeous.mp3"
  )
  end

  album5 = Album.create!(name: 'Top hits', artist: artist4)
  song10 = Song.create!(name: 'Starlight', album: album5, runtime: '3:25')
  song11 = Song.create!(name: 'No Sleep', album: album5, runtime: '3:27')
  song12 = Song.create!(name: 'Follow', album: album5, runtime: '3:41')
  song13 = Song.create!(name: 'In The Name Of Love', album: album5, runtime: '3:18')
  song14 = Song.create!(name: 'High On Life', album: album5, runtime: '3:46')

  Album.where(id: 5)[0]
  album5_photo = URI.open('https://jamify-seeds.s3.amazonaws.com/top-hits.jpeg')
  album5.photo.attach(io: album5_photo, filename: "top-hits.jpg")

  Song.where(id: 10).each_with_index do |song, index|
  song.mp3.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/starlight.mp3"),
    filename: "starlight.mp3"
  )
  end
  Song.where(id: 11).each_with_index do |song, index|
  song.mp3.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/no+sleep.mp3"),
    filename: "no-sleep.mp3"
  )
  end
  Song.where(id: 12).each_with_index do |song, index|
  song.mp3.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/follow.mp3"),
    filename: "follow.mp3"
  )
  end
  Song.where(id: 13).each_with_index do |song, index|
  song.mp3.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/name-of-love.mp3"),
    filename: "name-of-love.mp3"
  )
  end
  Song.where(id: 14).each_with_index do |song, index|
  song.mp3.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/high-on-life.mp3"),
    filename: "high-on-life.mp3"
  )
  end

  album6 = Album.create!(name: 'Top Songs', artist: artist5)
  song15 = Song.create!(name: 'Take Flight', album: album6, runtime: '4:37')
  song16 = Song.create!(name: 'Let Me Go', album: album6, runtime: '3:42')
  song17 = Song.create!(name: 'Hammer', album: album6, runtime: '3:18')
  song18 = Song.create!(name: 'LaserBeam', album: album6, runtime: '3:46')

  Album.where(id: 6)[0]
  album6_photo = URI.open('https://jamify-seeds.s3.amazonaws.com/sull-king.jpeg')
  album6.photo.attach(io: album6_photo, filename: "sull-king.jpg")

  Song.where(id: 15).each_with_index do |song, index|
  song.mp3.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/take-flight.mp3"),
    filename: "take-flight.mp3"
  )
  end
  Song.where(id: 16).each_with_index do |song, index|
  song.mp3.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/let-me-go.mp3"),
    filename: "let-me-go.mp3"
  )
  end
  Song.where(id: 17).each_with_index do |song, index|
  song.mp3.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/hammer.mp3"),
    filename: "hammer.mp3"
  )
  end
  Song.where(id: 18).each_with_index do |song, index|
  song.mp3.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/laserbeam.mp3"),
    filename: "laserbeam.mp3"
  )
  end

  album7 = Album.create!(name: 'Head Bang', artist: artist6)
  song19 = Song.create!(name: 'Gassed Up', album: album7, runtime: '4:03')
  song20 = Song.create!(name: 'Scream Saver', album: album7, runtime: '3:50')
  song21 = Song.create!(name: 'Into Pieces', album: album7, runtime: '3:28')
  song22 = Song.create!(name: 'House Party', album: album7, runtime: '3:25')
  song23 = Song.create!(name: 'Gravity', album: album7, runtime: '6:04')

  Album.where(id: 7)[0]
  album7_photo = URI.open('https://jamify-seeds.s3.amazonaws.com/subtronics.jpeg')
  album7.photo.attach(io: album7_photo, filename: "subtronics.jpg")

  Song.where(id: 19).each_with_index do |song, index|
  song.mp3.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/gassed.mp3"),
    filename: "gassed.mp3"
  )
  end
  Song.where(id: 20).each_with_index do |song, index|
  song.mp3.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/screamsaver.mp3"),
    filename: "sceamsaver.mp3"
  )
  end
  Song.where(id: 21).each_with_index do |song, index|
  song.mp3.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/into-pieces.mp3"),
    filename: "into-pieces.mp3"
  )
  end
  Song.where(id: 22).each_with_index do |song, index|
  song.mp3.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/house-party.mp3"),
    filename: "house-party.mp3"
  )
  end
  Song.where(id: 23).each_with_index do |song, index|
  song.mp3.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/gravity.mp3"),
    filename: "gravity.mp3"
  )
  end

  album8 = Album.create!(name: '2022 SetList', artist: artist7)
  song24 = Song.create!(name: 'Love Is Gone', album: album8, runtime: '4:11')
  song25 = Song.create!(name: 'First Time', album: album8, runtime: '4:57')
  song26 = Song.create!(name: 'Your Fault', album: album8, runtime: '5:14')
  song27 = Song.create!(name: 'Superhuman', album: album8, runtime: '4:28')
  song28 = Song.create!(name: 'Blood on Me', album: album8, runtime: '3:12')
  song29 = Song.create!(name: 'All You Need To Know', album: album8, runtime: '3:59')
  song30 = Song.create!(name: 'Potions', album: album8, runtime: '3:36')
  song31 = Song.create!(name: 'Hurts Sometimes', album: album8, runtime: '3:46')

  Album.where(id: 8)[0]
  album8_photo = URI.open('https://jamify-seeds.s3.amazonaws.com/slander.jpeg')
  album8.photo.attach(io: album8_photo, filename: "slander.jpg")

  Song.where(id: 24).each_with_index do |song, index|
  song.mp3.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/love_is_gone.mp3"),
    filename: "love-is-gone.mp3"
  )
  end
  Song.where(id: 25).each_with_index do |song, index|
  song.mp3.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/first-time.mp3"),
    filename: "first-time.mp3"
  )
  end
  Song.where(id: 26).each_with_index do |song, index|
  song.mp3.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/your-fault.mp3"),
    filename: "your-fault.mp3"
  )
  end
  Song.where(id: 27).each_with_index do |song, index|
  song.mp3.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/superhuman.mp3"),
    filename: "superhuman.mp3"
  )
  end
  Song.where(id: 28).each_with_index do |song, index|
  song.mp3.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/blood-on-me.mp3"),
    filename: "blood-on-me.mp3"
  )
  end
  Song.where(id: 29).each_with_index do |song, index|
  song.mp3.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/all-you-need.mp3"),
    filename: "all-you-need.mp3"
  )
  end
  Song.where(id: 30).each_with_index do |song, index|
  song.mp3.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/potions.mp3"),
    filename: "potions.mp3"
  )
  end
  Song.where(id: 31).each_with_index do |song, index|
  song.mp3.attach(
    io: URI.open("https://jamify-seeds.s3.amazonaws.com/hurts.mp3"),
    filename: "hurts.mp3"
  )
  end