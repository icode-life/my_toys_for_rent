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

u1 = User.create(email: 'mikel@example.com', password: '12345678', f_name: 'Mikel', l_name: 'C', address: '1039 Lodgeville Road', photo: 'image/upload/v1541674806/ri1v5dh8ynr68smz41ev.jpg')
u2 = User.create(email: 'nhu@example.com', password: '12345678', f_name: 'Nhu', l_name: 'T', address: '1039 Lodgeville Road', photo: 'image/upload/v1541674871/yzfs3fsjxqwieu7gsvpa.jpg')
u3 = User.create(email: 'tarig@example.com', password: '12345678', f_name: 'Tarig', l_name: 'B', address: '1039 Lodgeville Road', photo: 'image/upload/v1541674909/vm2fwqiom4bmrhtwxi9i.png')
u4 = User.create(email: 'andrzej@example.com', password: '12345678', f_name: 'Andrzej', l_name: 'G', address: '1039 Lodgeville Road', photo: 'image/upload/v1541674952/jzcheuouohjfgwok6gcr.jpg')
u5 = User.create(email: 'user5@example.com', password: '12345678', f_name: 'User', l_name: 'Five', address: '1039 Lodgeville Road', photo: 'image/upload/v1541628131/aehblu7tqautviipzjvf.png')


t1 = Toy.new(name: 'GiJoe', category: 'Heroes', price: '123', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam cursus venenatis bibendum. Donec risus ligula, sodales nec ultrices at, ultrices vel urna. Nunc scelerisque sit amet enim nec vehicula.')
t1.owner = u1
t1.save!

t2 = Toy.create(name: 'Batman', category: 'Games', price: '321', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam cursus venenatis bibendum. Donec risus ligula, sodales nec ultrices at, ultrices vel urna. Nunc scelerisque sit amet enim nec vehicula.')
t2.owner = u2
t2.save!

b1 = Booking.create(date_start: Date.new(2001,2,3), date_end: Date.new(2001,2,5), user_id: 1, toy_id: 1)
b1.save!

b2 = Booking.create(date_start: Date.new(2002,3,4), date_end: Date.new(2003,5,5), user_id: 2, toy_id: 2)
b2.save!

puts "Done!"


