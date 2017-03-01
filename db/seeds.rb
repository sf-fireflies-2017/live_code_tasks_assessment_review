Task.destroy_all
List.destroy_all

3.times do
  list = List.create(name: Faker::Name.name, description: Faker::Superhero.name)

  5.times do
    list.tasks.create(text: Faker::Pokemon.location)
  end
end