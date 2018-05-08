10.times do
  Author.create name: Faker::Name.name, description: Faker::Lorem.sentence(5)
end
10.times do
  Category.create name: Faker::Name.name
end

100.times do
  book = Book.create name: Faker::Lorem.sentence,
    publish_year: rand(1990..2017), default_price: rand(3..50),
    content: Faker::Lorem.sentence(100), category_id: rand(1..10),
    author_id: rand(1..10)

  5.times do
    book.images.create image_path: "/images/howtowin.jpg"
  end
end

User.create email:"nguyenhuydung@gmail.com", name: "nghdung",
  full_name: "Nguyen Huy Dung", address: "Di Nau, TT, HN", phone: "0964530265",
  password: "123123", password_confirmation: "123123"
