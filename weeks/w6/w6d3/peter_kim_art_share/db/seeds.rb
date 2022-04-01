# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ArtworkShare.destroy_all
Artwork.destroy_all
User.destroy_all

mike = User.create!(username: 'professor_of_logic')
chris = User.create!(username: "president_dellacqua")
sam = User.create!(username: 'Samsung')
taylor = User.create!(username: 'taylor_made')
paulo = User.create!(username: 'paulito')
jack = User.create!(username: 'jack_attack')

artwork1 = Artwork.create!(title: 'Art1', image_url: 'Star Trek is wayyy better than Star Wars', artist_id: mike.id)
artwork2 = Artwork.create!(title: 'Art2', image_url: 'Yer a lizard, Harry', artist_id: chris.id)
artwork3 = Artwork.create!(title: 'Art3', image_url: 'LG is trash, yo', artist_id: sam.id)
artwork4 = Artwork.create!(title: 'Art4', image_url: 'Oh boy, I love rails!', artist_id: taylor.id)
artwork5 = Artwork.create!(title: 'Art5', image_url: 'I got stuck on Abyss Watchers in DS3!', artist_id: paulo.id)
artwork6 = Artwork.create!(title: 'Art6', image_url: 'Just snowed in Vail, gonna hit the slops today', artist_id: jack.id)
artwork7 = Artwork.create!(title: 'Art7', image_url: 'Picard is the GOAT', artist_id: mike.id)
artwork8 = Artwork.create!(title: 'Art8', image_url: 'Wish I could go surfing in CO', artist_id: jack.id)
artwork9 = Artwork.create!(title: 'Art9', image_url: 'Going on a roadtrip!', artist_id: sam.id)
artwork10 = Artwork.create!(title: 'Art10', image_url: 'Has anyone seen my shoes?', artist_id: taylor.id)

ArtworkShare.create!(artwork_id: artwork5.id, viewer_id: chris.id)
ArtworkShare.create!(artwork_id: artwork8.id, viewer_id: chris.id)
ArtworkShare.create!(artwork_id: artwork10.id, viewer_id: chris.id)
ArtworkShare.create!(artwork_id: artwork2.id, viewer_id: sam.id)
ArtworkShare.create!(artwork_id: artwork4.id, viewer_id: sam.id)
ArtworkShare.create!(artwork_id: artwork7.id, viewer_id: sam.id)
ArtworkShare.create!(artwork_id: artwork2.id, viewer_id: taylor.id)
ArtworkShare.create!(artwork_id: artwork3.id, viewer_id: taylor.id)
ArtworkShare.create!(artwork_id: artwork6.id, viewer_id: taylor.id)
ArtworkShare.create!(artwork_id: artwork8.id, viewer_id: taylor.id)
ArtworkShare.create!(artwork_id: artwork2.id, viewer_id: paulo.id)
ArtworkShare.create!(artwork_id: artwork4.id, viewer_id: paulo.id)
ArtworkShare.create!(artwork_id: artwork6.id, viewer_id: paulo.id)
ArtworkShare.create!(artwork_id: artwork9.id, viewer_id: paulo.id)
ArtworkShare.create!(artwork_id: artwork10.id, viewer_id: paulo.id)
ArtworkShare.create!(artwork_id: artwork2.id, viewer_id: jack.id)
ArtworkShare.create!(artwork_id: artwork9.id, viewer_id: jack.id)