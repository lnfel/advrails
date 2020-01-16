# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

type_list = [
	"For sale / Wanted",
	"Personals",
	"Housing (offering)",
	"Housing (need)",
	"Community",
	"Service offered",
	"Campus job",
	"Job off-campus"
]

category_list = [
	[ "For sale / Wanted", "Art + Shop" ],
	[ "For sale / Wanted", "Barter" ],
	[ "For sale / Wanted", "Bicycle" ],
	[ "For sale / Wanted", "Books" ],
	[ "For sale / Wanted", "Cars" ],
	[ "For sale / Wanted", "CDs/DVDs" ],
	[ "For sale / Wanted", "Clothing and Accessories" ],
	[ "For sale / Wanted", "Computers and Tech" ],
	[ "For sale / Wanted", "Electronics" ],
	[ "For sale / Wanted", "Free stuffs" ],
	[ "For sale / Wanted", "Furniture" ],
	[ "For sale / Wanted", "Games" ],
	[ "For sale / Wanted", "General" ],
	[ "For sale / Wanted", "Household items" ],
	[ "For sale / Wanted", "Items wanted" ],
	[ "For sale / Wanted", "Tickets" ],
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
	[ "Housing (need)", "Apt./Housing wanted" ],
	[ "Housing (need)", "Room/Share wanted" ],
	[ "Housing (need)", "Sublet/Temporary wanted" ],
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
	Type.create( name: name )
end

category_list.each do | type, name |
	Category.find_or_create_by( type_id: Type.find_by( name: type ).id, name: name )
end