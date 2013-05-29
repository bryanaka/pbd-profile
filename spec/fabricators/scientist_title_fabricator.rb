require 'faker'
Fabricator(:scientist_title) do
	scientist
  title   { Faker::Company.bs }
  order		{ rand(1..5) }
end
