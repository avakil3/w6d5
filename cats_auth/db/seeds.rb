# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    User.destroy_all
    Cat.destroy_all
    CatRentalRequest.destroy_all

    user1 = User.create!(user_name:"Katie", password: "hello123", session_token: "BLAH1")
    user2 = User.create!(user_name:"Aagam", password: "password", session_token: "BLAH2")
    user3 = User.create!(user_name:"Kevin", password: "ilovecats", session_token: "BLAH3")
    
    cats_1 = Cat.create!(birth_date: '2000/01/01', name: 'Fluffers', color: 'black', sex: 'M', description: "hi my name is Fluffers", user_id:user1.id)
    cats_2 = Cat.create!(birth_date: "2020/01/02", name: "Mr.Paws", color: "orange", sex: "M", user_id:user2.id)
    cats_3 = Cat.create!(birth_date: "2010/11/11", name: "Stormy", color: "white", sex: "F", user_id:user3.id)
