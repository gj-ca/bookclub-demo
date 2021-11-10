Author.destroy_all
Genre.destroy_all

jkr = Author.create(first_name: "JK", last_name: "Rowling")
clarke = Author.create(first_name: "Arthur", last_name: "Clarke")
foo = Author.create(first_name: "Test", last_name: "Author")
bar = Author.create(first_name: "Another", last_name: "Person")

genres = [
    Genre.create!(name: "Fantasy"),
    Genre.create!(name: "Sport"),
    Genre.create!(name: "Romance"),
    Genre.create!(name: "Sci-Fi"),
    Genre.create!(name: "Political"),
    Genre.create!(name: "Other"),
    Genre.create!(name: "Children")
]

User.create!(email: "foo@bar.com", password: "password")

User.first.add_role(:admin)

Book.create!(user: User.first, price: 1000, title: "Harry Potter", author: jkr, publisher: "Penguin", date_published: "2021-10-26", genres: [genres[0], genres[6]])
Book.create!(user: User.first, price: 2000, title: "Fantastic Beasts", author: jkr, publisher: "Apple", date_published: "2021-10-26", genres: [genres[0]])
Book.create!(user: User.first, price: 3000, title: "2001", author: clarke, publisher: "foo", date_published: "2021-10-26", genres: [genres[3]])
Book.create!(user: User.first, price: 4000, title: "A Fall Of Moondust", author: clarke, publisher: "blah", date_published: "2021-10-26",  genres: [genres[3]])


puts "#{Author.count}/4 authors were created"
puts "#{Genre.count}/7 genres were created"
puts "#{Book.count}/4 books were created"