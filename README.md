An antipode is the point on the planet that is diametrically opposite.

You will create an endpoint like so:, `/api/v1/antipode?loc=hongkong`

You will use the `Amypode API` to determine the antipode for Hong Kong.

[`http://amypode.herokuapp.com/api/v1/antipodes?lat=27&long=-82`]

This is a sample request. Amypode API requires header based authentication. It expects the  `api_key` header to be set to your key, which is `oscar_the_grouch`

Your endpoint will give the user the original city, and the antipode's location name and its current weather summary and current temperature.

To retrieve the antipode's name use something like Google's reverse geocoding documented here: https://developers.google.com/maps/documentation/geocoding/start

You should reuse the code you have currently written for retrieving weather.

Your response should resemble the structure and contain the following data:

```
{
    "data": [
        {
            "id": "1",
            "type": "antipode",
            "attributes": {
                "location_name": "Antipode City Name",
                "forecast": {
                    "summary": "Mostly Cloudy,
                    "current_temperature": "72",
                				},
            "search_location": "Hong Kong"
            }
        }
    ]
}
