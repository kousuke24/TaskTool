# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
100.times do |t|
  if t % 2 == 0
    Task.create(title: "b#{t}", status_id: 2, priority_id: 2)
  elsif t % 3 == 0
    Task.create(title: "c#{t}", status_id: 3, priority_id: 3)
  else
    Task.create(title: "a#{t}", status_id: 1, priority_id: 1)
  end
end