require 'faker'
Fabricator(:scientist_website) do
	scientist
  name         { Faker::Company.name }
  url          { Faker::Internet.url }
  description  { Faker::Lorem.paragraph }
end
