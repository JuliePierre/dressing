# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


MissingItem.destroy_all
MissingItem.create(name: "Robe")
MissingItem.create(name: "Top")
MissingItem.create(name: "Veste")
MissingItem.create(name: "Pantalon")
MissingItem.create(name: "Jupe")
MissingItem.create(name: "Combinaison")
MissingItem.create(name: "Blouse")
MissingItem.create(name: "Manteau")
MissingItem.create(name: "Chaussures")
MissingItem.create(name: "Chapeau")
MissingItem.create(name: "Pochette")
MissingItem.create(name: "Bandeau")
MissingItem.create(name: "Collier")

User.create(first_name: "Perrine", last_name: "Duffaure", email: "perrine@mail.fr", password: "azerty")
User.create(first_name: "Manolie", last_name: "Cotin", email: "manolie@mail.fr", password: "azerty")
User.create(first_name: "Valerie", last_name: "Jadot", email: "valerie@mail.fr", password: "azerty")
User.create(first_name: "Fanny", last_name: "Robert", email: "fanny@mail.fr", password: "azerty")
User.create(first_name: "Clara", last_name: "Fayard", email: "clara@mail.fr", password: "azerty")
