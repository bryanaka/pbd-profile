require 'faker'
Fabricator(:profile, from: :scientist_profile) do
  prefix         "Dr."
  department     { Faker::Company.name }
  department_url { Faker::Internet.url }
  company        "Lawrence Berkeley National Laboratory"
  address1       { Faker::Address.street_address }
  address2       { Faker::Address.secondary_address }
  city           { Faker::Address.city }
  state          { Faker::Address.state }
  zip_code       { Faker::Address.zip_code }
  phone1         { Faker::PhoneNumber.phone_number }
  phone2_type    "Cell"
  phone2         { Faker::PhoneNumber.cell_phone }
  email          { Faker::Internet.safe_email }
  summary        { Faker::Lorem.paragraphs.join("<br>\n") }
  emphasis       { Faker::Lorem.paragraphs.join("<br>\n") }
  location       "My Random Location"
  scientist_id   nil
end
