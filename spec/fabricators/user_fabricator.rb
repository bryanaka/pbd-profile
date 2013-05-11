require 'faker'

Fabricator(:user) do
	base_name = Faker::Name.name
  eppn    { base_name + "@lbl.gov" }
  name    { base_name }
  email    { base_name + "@lbl.gov" }
  picture { Faker::Internet.url + ".jpg" }
end
