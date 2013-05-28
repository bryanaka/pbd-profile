require 'faker'

Fabricator(:user) do
	base_name = Faker::Name.name
  eppn    { base_name + "@lbl.gov" }
  name    { base_name }
  email    { base_name + "@lbl.gov" }
  confirmed false
  scientist_id nil
  #picture { Faker::Internet.url + ".jpg" }
end
