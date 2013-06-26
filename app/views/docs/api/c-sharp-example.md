C# Example - [From MSDN Forums](http://social.msdn.microsoft.com/Forums/windowsapps/en-US/db466fde-9056-4d01-b46d-cfa49c312c02/parsing-json-with-httpclient)
=================================================
	
	using System.Net.Http;

    var client = new HttpClient();
    var uri = new Uri("https://pbd.lbl.gov/pbdportal/api/v1/scientists/padams");
    var response = await client.GetStringAsync(uri);
    JsonObject parser = JsonObject.Parse(response);
    var STREAMSTATUS = parser["STREAMSTATUS"].GetBoolean();

    # JsonObject has the data now as an Object