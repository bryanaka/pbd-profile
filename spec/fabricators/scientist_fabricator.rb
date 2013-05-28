require 'faker'
Fabricator(:scientist) do
  first_name { Faker::Name.first_name }
  last_name  { Faker::Name.last_name }
  #picture		 { { :url => Faker::Name.first_name[0] + Faker::Name.last_name + ".jpg" } }
  title      "Scientist Dude"
  slug       { Faker::Name.first_name[0] + Faker::Name.last_name }
  #after_create { |picture| picture.file = File.open(File.join(Rails.root,'spec','support','img','logo.png')) }
end
