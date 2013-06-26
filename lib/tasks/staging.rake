require 'faker'
require 'open-uri'
require 'pp'

namespace :staging do
  desc "Create a staging account for users to play around with"
  task :create_scientist => :environment do
  	email = ''
  	scientist = nil
  	profile = nil
  	
  	STDOUT.puts "What is the email address of the test user?"
  	email = STDIN.gets.chomp

  	# grab a picture


  	# create a scientist
  	# FIX: Not generating unique id...
  	scientist = Scientist.new({
  		first_name: Faker::Name.first_name,
  		 last_name: Faker::Name.last_name,
  					slug: Faker::Name.first_name,
  				 title: Faker::Company.bs,
  			 picture: file,
  			 visible: false
  	})

  	id = Scientist.last.id
  	id += 1

  	# picture = open('tmp/lorempixel/lorempixel'+ ( rand(0 .. 9).to_s ) +'.png', 'wb') { |file| file << open('http://lorempixel.com/175/250/people').read }

  	scientist.id = id
  	# scientist.picture = picture

  	pp scientist

  	scientist.save!

  	# create a profile
  	profile = ScientistProfile.create({
  							prefix: nil,
    				department: Faker::Company.name,
    		department_url: Faker::Internet.url,
    					 company: "Lawrence Berkeley National Laboratory",
    					address1: "1 Cyclotron Road",
    					address2: "Mailstop Donner",
    							city: "Berkeley",
    						 state: "CA",
    					zip_code: "94120",
    						phone1: "555-555-5555",
    			 phone2_type: "Cell",
    						phone2: "444-444-4444",
    						 email: email,
    					 summary: Faker::Lorem.paragraph * 3,
    					emphasis: Faker::Lorem.paragraph * 2,
    					location: nil,
    			scientist_id: scientist.id,
    	publications_url: Faker::Internet.url
  	})

  	pp profile

  end

  desc "Create a staging admin account"
  task :create_admin => :environment do
  end

  desc "TODO"
  task :clean_staging_accounts => :environment do
  end

end
