# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@work = Folder.create(name: "Work")
@play = Folder.create(name: "Play")
@well = Folder.create(name: "Well-being")

@work.children.create :name => "Personal"
@work.children.create :name => "Team"
@work.children.create :name => "Todo"

@play.children.create :name => "Literature"
@play.children.create :name => "Media"
@play.children.create :name => "Sports"

@well.children.create :name => "Education"
@well.children.create :name => "Fitness"
@well.children.create :name => "Nutrition"

































