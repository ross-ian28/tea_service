# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
customer = Customer.create(first_name: "Pabu", last_name: "Ross", email: "ferret@email.com", address: "123 Ferret Street")
tea1 = Tea.create(title: "Green", description: "My favorite", temperature: 240, brew_time: 20)
tea2 = Tea.create(title: "Herbal", description: "Good stuff", temperature: 245, brew_time: 30)
sub1 = Subscription.create(title: "Silver", price: 2.00, status: "Active", frequency: "Monthly", customer_id: customer.id, tea_id: tea1.id)
sub1 = Subscription.create(title: "Platinum", price: 5.00, status: "Canceled", frequency: "Monthly", customer_id: customer.id, tea_id: tea2.id)
