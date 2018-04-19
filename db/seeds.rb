Author.create(name:"James Comey", description: "James Brien Comey Jr. is an American lawyer, who served as the seventh Director of the Federal Bureau of Investigation from September 4, 2013, until his dismissal on May 9, 2017")
Author.create(name:"Melinda Leigh", description:"Wall Street Journal bestselling author Melinda Leigh is a fully recovered banker. A lifelong lover of books, she started writing as a way to preserve her sanity when her youngest child entered first grade")
Author.create(name:"David Baldacci", description:"David Baldacci is a bestselling American novelist")
Author.create(name:"J. K. Rowling", description:"Joanne Rowling, CH, OBE, FRSL, FRCPE, writing under the pen names J. K. Rowling and Robert Galbraith, is a British novelist, screenwriter, and producer who is best known for writing the Harry Potter fantasy series.")
Author.create(name:"Bella Forrest", description:"Bella Forrest is the bestselling author of the A Shade of Vampire Series, The Gender Game Series, A Shade of Kiev Series, Detective Erin Bond Series and others. She made the self published best seller list in 2017 with her title A Shield of Glass.")
Author.create(name:"James Patterson", description:"James Brendan Patterson is an American author and philanthropist. ")
Author.create(name:"Stephen R. Covey", description:"Stephen Richards Covey was an American educator, author, businessman, and keynote speaker.")
Author.create(name:"Catherine Bybee", description:"Catherine Bybee is a New York Times, USA Today, #1 Wall Street Journal, and #1 Amazon Bestselling author of romance novels. ")
Author.create(name:"R.R. Banks", description:"R.R. Banks is one of the most famous novelist")
Author.create(name:"Rick Riordan", description:"Richard Russell Riordan Jr., is an American author. He is known for writing the Percy Jackson & the Olympians series, about a twelve-year-old boy who discovers he is a son of Poseidon.")

10.times do
  Category.create name: Faker::Name.name
end

100.times do
  book = Book.create name: Faker::Lorem.sentence,
    publish_year: rand(1990..2017), default_price: 265656,
    content: Faker::Lorem.sentence(100), category_id: rand(1..10),
    author_id: rand(1..10)

  5.times do
    book.images.create image_path: "/images/howtowin.jpg"
  end
end
