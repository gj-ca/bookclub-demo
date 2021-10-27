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

Book.create!(title: "Harry Potter", author: jkr, publisher: "Penguin", date_published: "2021-10-26", genres: [genres[0], genres[6]])
Book.create!(title: "Fantastic Beasts", author: jkr, publisher: "Apple", date_published: "2021-10-26", genres: [genres[0]])
Book.create!(title: "2001", author: clarke, publisher: "foo", date_published: "2021-10-26", genres: [genres[3]])
Book.create!(title: "A Fall Of Moondust", author: clarke, publisher: "blah", date_published: "2021-10-26",  genres: [genres[3]])