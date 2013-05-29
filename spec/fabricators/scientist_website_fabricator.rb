require 'faker'
Fabricator(:scientist_website) do
	scientist
  name         { Faker::Company.name }
  url          { Faker::Internet.url }
  description  { ("yo"*100) }
  order 			 { rand(1..4) }
end
