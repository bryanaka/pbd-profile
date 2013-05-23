require 'faker'
Fabricator(:scientist_profile) do
  prefix         "Dr."
  positions_held { Faker::Company.bs }
  department     "MyString"
  department_url "MyString"
  company        "MyString"
  address1       "MyString"
  address2       "MyString"
  city           "MyString"
  state          "MyString"
  zip_code       1
  phone1         "MyString"
  phone2_type    "MyString"
  phone2         "MyString"
  email          "MyString"
  summary        "MyText"
  emphasis       "MyText"
  location       "MyText"
  scientist_id   1
end
