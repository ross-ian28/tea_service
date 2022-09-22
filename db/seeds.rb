# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
customer = Customer.create(first_name: "Pabu", last_name: "Ross", email: "ferret@email.com", address: "123 Ferret Street")
tea = Tea.create(title: "Silver", description: "My favorite", temperature: 240, brew_time: 20)
