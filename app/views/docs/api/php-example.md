PHP Example
============

    $curl = curl_init();
    curl_setopt_array($curl, array(
        CURLOPT_RETURNTRANSFER => 1,
        CURLOPT_URL => 'https://pbd.lbl.gov/pbdportal/api/v1/scientists/padams'
    ));
    $response = curl_exec($curl);
    curl_close($curl);
	
	$pauls_data = json_decode($response)
    $pauls_data->first_name 
    #=> Paul