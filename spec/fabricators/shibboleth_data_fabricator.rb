require 'faker'

Fabricator(:shibboleth_data) do
  eppn	{ Faker::Internet.email }
  email { |attrs| "#{attrs[:eppn].parameterize}" }
  name	{ Faker::Name.name }
end
