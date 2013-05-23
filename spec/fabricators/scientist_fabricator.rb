require 'faker'
Fabricator(:scientist) do
  first_name { Faker::name.first_name }
  last_name  { Faker::name.last_name }
  picture    { Faker::Internet.url + ".jpg" }
  title      "Scientist Dude"
  slug       { Faker::name.first_name[0] + Faker::name.last_name }
end
