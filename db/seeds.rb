# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

type_list = [
	"For sale or Wanted",
	"Personals",
	"Housing (offering)",
	"Housing (need)",
	"Community",
	"Service offered",
	"Campus job",
	"Job off-campus"
]

category_list = [
	[ "For sale or Wanted", "Art + Shop" ],
	[ "For sale or Wanted", "Barter" ],
	[ "For sale or Wanted", "Bicycle" ],
	[ "For sale or Wanted", "Books" ],
	[ "For sale or Wanted", "Cars" ],
	[ "For sale or Wanted", "CDs or DVDs" ],
	[ "For sale or Wanted", "Clothing and Accessories" ],
	[ "For sale or Wanted", "Computers and Tech" ],
	[ "For sale or Wanted", "Electronics" ],
	[ "For sale or Wanted", "Free stuffs" ],
	[ "For sale or Wanted", "Furniture" ],
	[ "For sale or Wanted", "Games" ],
	[ "For sale or Wanted", "General" ],
	[ "For sale or Wanted", "Household items" ],
	[ "For sale or Wanted", "Items wanted" ],
	[ "For sale or Wanted", "Tickets" ],
	[ "Personals", "Friendship" ],
	[ "Personals", "General romance" ],
	[ "Personals", "Girl wants girl" ],
	[ "Personals", "Girl wants guy" ],
	[ "Personals", "Guy wants girl" ],
	[ "Personals", "Guy wants guy" ],
	[ "Housing (offering)", "Apartments for rent" ],
	[ "Housing (offering)", "Housing swap" ],
	[ "Housing (offering)", "Room and shares" ],
	[ "Housing (offering)", "Storage and parking" ],
	[ "Housing (offering)", "Sublets and temporary" ],
	[ "Housing (need)", "Apt. or Housing wanted" ],
	[ "Housing (need)", "Room or Share wanted" ],
	[ "Housing (need)", "Sublet or Temporary wanted" ],
	[ "Community", "Activity partners" ],
	[ "Community", "Advice" ],
	[ "Community", "Childcare" ],
	[ "Community", "Classes" ],
	[ "Community", "Funny" ],
	[ "Community", "General community" ],
	[ "Community", "Groups" ],
	[ "Community", "Local news and views" ],
	[ "Community", "Lost and Found" ],
	[ "Community", "Politics" ],
	[ "Community", "Religion" ],
	[ "Community", "Rideshare" ],
	[ "Community", "Volunteers" ],
	[ "Service offered", "Computer services" ],
	[ "Service offered", "General" ],
	[ "Service offered", "Tutoring" ],
	[ "Campus job", "Admin" ],
	[ "Campus job", "General" ],
	[ "Campus job", "Research" ],
	[ "Campus job", "Teaching" ],
	[ "Campus job", "Tutoring" ],
]

type_list.each do | name |
	Type.create(name: name)
end

category_list.each do | type, name |
	Category.find_or_create_by(type_id: Type.find_by( name: type ).id, name: name)
end

#10.times do
#	type_id = Faker::Number.within(range: 1..8)
#	type = Type.where(id: type_id)
#	cat_length = Category.where(type_id: type_id).length
#	category = Faker::Number.between(from: 1, to: cat_length.to_i)
#	price = Faker::Commerce.price(range: 100..5000)
#	paragraphs = Faker::Number.within(range: 1..3)
#	description = Faker::Lorem.paragraphs(number: paragraphs)
#	Post.create(type_id: type_id, category_id: category, title: Faker::Book.title, price: price, description: description, email: Faker::Internet.email)
#end

#i = 0

#loop do
#	i += 1
#	post_id = i
#	filename = i.to_s + '.jpg'
#	post = Post.find_by(id: post_id)
	#post.update(feature_images: Rails.root + '/assets/images/' + filename)
#	post.feature_images.attach(io: File.open(Rails.root + ActionController::Base.helpers.asset_path), filename: filename)
#	if i == 3
#		break
#	end
#end