# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Toy.destroy_all
User.destroy_all
Booking.destroy_all

u  = User.create(email: 'ucl_mike1@yahoo.fr', password: '12345678')
u2 = User.create(email: 'gmailuser@yahoo.fr', password: '12345678')

t1 = Toy.new(name: 'gijoe', category: 'bigboytoy', price: '123', description: 'chuzhcuqehuchzeuqihcl')
t1.owner = u
t1.save

t2 = Toy.create(name: 'batman', category: 'smallboytoy', price: '321', description: 'chuzftufthygvjeuqihcl')
t2.owner = u2
t2.save

b1 = Booking.create(date_start: Date.new(2001,2,3), date_end: Date.new(2001,2,5), user_id: 1, toy_id: 1)
b1.save

b2 = Booking.create(date_start: Date.new(2002,3,4), date_end: Date.new(2003,5,5), user_id: 2, toy_id: 2)
b1.save
