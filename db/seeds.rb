# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



u  = User.create(email: 'ucl_mike1@yahoo.fr', password: '12345678')
u2 = User.create(email: 'gmailuser@yahoo.fr', password: '12345678')
t1 = Toy.new(name: 'gijoe', category: 'bigboytoy', price: '123', description: 'chuzhcuqehuchzeuqihcl')
t1.owner = u
t1.save
t2 = Toy.create(name: 'batman', category: 'smallboytoy', price: '321', description: 'chuzftufthygvjeuqihcl')
t2.owner = u2
t2.save

