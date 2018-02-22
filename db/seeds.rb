# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Movie.create!([
#   {
#     name: "Transformer", 
#     summary: "The fate of humanity is at stake when two races of robots, the good Autobots and the villainous Decepticons, bring their war to Earth. The robots have the ability to change into different mechanical objects as they seek the key to ultimate power. Only a human youth, Sam Witwicky (Shia LaBeouf) can save the world from total destruction", 
#     actor: "Mark Wahlberg", 
#     rating: 10, 
#     genre:"Action Film",
#     content_url: "http://techslides.com/demos/sample-videos/small.mp4"
#   }
#   ])

# Image.create!([
  # {image_url:"http://t3.gstatic.com/images?q=tbn:ANd9GcShVoGfnvhFVzzcgv-xKrqotmkrRY1IPWhQsQ7eE_aZhKsAl-eC", movie_id: 3}])

  User.create!([ {first_name: "Afzal", last_name: "Masra", email:"afzalmasra@yao.com", password: "password"}
    ])

