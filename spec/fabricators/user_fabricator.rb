require 'faker'

Fabricator(:user) do
  eppn    { Faker::Internet.email }
  name    { Faker::Name.name }
  email   { Faker::Internet.email }
  confirmed false
  scientist_id nil
  #picture { Faker::Internet.url + ".jpg" }
end
