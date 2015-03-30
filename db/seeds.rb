# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

MatchResult.delete_all
Match.delete_all
Player.delete_all

array = ['14239003.jpg',
          '14239056.jpg',
          'Cody-Shelton-600x600.jpg',
          'Daniel-Gonzalez-600x600.jpg',
          'David-Beckham-New-Hairstyle-2012-david-beckham-30515174-1707-2560.jpg',
          'French-soccer-player-Laure-Boulleau-can-give-Hollywood-actress-a-run-for-their-money-beacuse-of-her-radiant-looks-and-a-well-toned-figure.jpg',
          'full_4633.jpg',
          'gerard-pique.jpg',
          'Joaquin-Rivas-600x600.jpg',
          'ozil-for-box.jpg',
          'soc_g_ronaldoc_600.jpg',
          'us-soccer-damarcus-beasley-lalas-hair-1.jpg']

30.times do
  Player.create(avatar: File.open("#{Rails.root}/public/players/#{array.sample}"),
      last_name: Faker::Name.last_name, first_name: Faker::Name.first_name)
end

Player.find_each(&:save)
