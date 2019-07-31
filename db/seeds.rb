# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name:"Dulce", username:"dulce88", email:"dulce@woof.com")
User.create(name:"Eli", username:"eli88", email:"eli@woof.com")
User.create(name:"Santiago", username:"santiago88", email:"santiago@woof.com")
Event.create(title: "First event", date_event: "2020-12-31", description: "My birthday", place: "Home", creator_id: 1)
Event.create(title: "Great wedding", date_event: "2020-11-15", description: "My weeding", place: "Night Club", creator_id: 1)
Event.create(title: "Pet birthday", date_event: "2020-10-31", description: "Dulce's Birthday", place: "At pet shop", creator_id: 2)
Event.create(title: "Spaceship launch", date_event: "2020-09-15", description: "MIR-688 Launching", place: "Area 51", creator_id: 2)