# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


MissingItem.destroy_all
a = MissingItem.create(name: "Chapeau")
b = MissingItem.create(name: "Foulard")
c = MissingItem.create(name: "Pochette")
d = MissingItem.create(name: "Collier")
e = MissingItem.create(name: "Bracelet")
e = MissingItem.create(name: "Veste")
e = MissingItem.create(name: "Chaussures")

