# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.delete_all

Banknote.create!(name: 'hundred', nominal: 100, quantity: 2)
Banknote.create!(name: 'fifty',   nominal: 50,  quantity: 3)
Banknote.create!(name: 'twenty',  nominal: 20,  quantity: 5)
Banknote.create!(name: 'ten',     nominal: 10,  quantity: 6)



