# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# disable password validation for admin
User.create(name: "admin", email: "admin@sciencecourses.rmit.edu.au", password: "password", role: "admin").on(validate: false)

User.create([
    {
        name: "Joshua Orozco",
        email: "joshua.orozco@rmit.edu.au",
        password: "123qweASD!@#",
        role: nil
    }
])