Ruby Example
===============

    # Depends on some sort of JSON deserializer 
    require 'rubygems'
    require 'open-uri'
	require 'multi_json'

    contents = URI.parse('https://pbd.lbl.gov/pbdportal/api/v1/scientists/padams').read
    pauls_data = MultiJson.load(contents, symbolize_keys: true)
    paul.first_name 
    #=> Paul