# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
state = ["As new", "Fine", "Very good", "Good", "Fair", "Poor"]

state.each do |s|
    Condition.create!(state: s)
    puts "Book condition created - #{s}."
end

 
#========== seed for categories =============
cat = [
    "Action and Adventure",
    "Classic",
    "Comic and Graphic Novel",
    "Crime and Detective",
    "Drama",
    "Fairy Tale",
    "Fantasy",
    "Historical Fiction",
    "Horror",
    "Humor",
    "Mystery",
    "Mythology",
    "Realistic Fiction",
    "Romance",
    "Satire",
    "Science Fiction",
    "Short Story",
    "Suspense/Thriller",
    "Biography/Autobiography",
    "Art/Photography",
    "Memoir",
    "History",
    "Reference Books",
    "Self-help Book",
    "Textbook",
    "Poetry",
    "Travel",
    "Language",
    "Sports",
    "Music"
]
    
cat.each do |d|
    Category.create!(
        name: d
    )
    puts "#{d} created."
end
    