# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'seeding ..'

User::ROLES.each do |role|
  Role.find_or_create_by(name: role)
end

TemplateItem::ITEMS.each do |item|
  TemplateItem.find_or_create_by(name: item)
end
puts 'seeding done.'
