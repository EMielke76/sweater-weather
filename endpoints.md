All endpoints should be prepended with 
```
https://localhost:3000
```
<hr>

## Forecast
Request:
```
GET /api/v1/forecast?location=denver,co
Content-Type: application/json
Accept: application/json
```
Example Response:
```json
status: 200
body:
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2022-03-08 22:36:34 -0700",
                "sunrise": "2022-03-08 06:22:28 -0700",
                "sunset": "2022-03-08 17:59:10 -0700",
                "temperature": 27.59,
                "feels_like": 20.98,
                "humidity": 54,
                "uvi": 0,
                "visibility": 10000,
                "conditions": "broken clouds",
                "icon": "04n"
            },
            "hourly_weather": [
                {
                    "time": "10:00:00",
                    "temperature": 27.97,
                    "conditions": "scattered clouds",
                    "icon": "03n"
                },
                {
                    "time": "11:00:00",
                    "temperature": 27.59,
                    "conditions": "broken clouds",
                    "icon": "04n"
                },
                {
                    "time": "12:00:00",
                    "temperature": 27.79,
                    "conditions": "scattered clouds",
                    "icon": "03n"
                },
                {
                    "time": "01:00:00",
                    "temperature": 27.93,
                    "conditions": "broken clouds",
                    "icon": "04n"
                },
                {
                    "time": "02:00:00",
                    "temperature": 27.23,
                    "conditions": "scattered clouds",
                    "icon": "03n"
                },
                {
                    "time": "03:00:00",
                    "temperature": 25.29,
                    "conditions": "scattered clouds",
                    "icon": "03n"
                },
                {
                    "time": "04:00:00",
                    "temperature": 24.44,
                    "conditions": "few clouds",
                    "icon": "02n"
                },
                {
                    "time": "05:00:00",
                    "temperature": 24.17,
                    "conditions": "few clouds",
                    "icon": "02n"
                }
            ],
            "daily_weather": [
                {
                    "date": "2022-03-08",
                    "sunrise": "2022-03-08 06:22:28 -0700",
                    "sunset": "2022-03-08 17:59:10 -0700",
                    "max_temp": 35.28,
                    "min_temp": 20.25,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2022-03-09",
                    "sunrise": "2022-03-09 06:20:54 -0700",
                    "sunset": "2022-03-09 18:00:13 -0700",
                    "max_temp": 27.93,
                    "min_temp": 17.24,
                    "conditions": "snow",
                    "icon": "13d"
                },
                {
                    "date": "2022-03-10",
                    "sunrise": "2022-03-10 06:19:20 -0700",
                    "sunset": "2022-03-10 18:01:16 -0700",
                    "max_temp": 24.48,
                    "min_temp": 14.36,
                    "conditions": "light snow",
                    "icon": "13d"
                },
                {
                    "date": "2022-03-11",
                    "sunrise": "2022-03-11 06:17:45 -0700",
                    "sunset": "2022-03-11 18:02:18 -0700",
                    "max_temp": 32.95,
                    "min_temp": 13.51,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2022-03-12",
                    "sunrise": "2022-03-12 06:16:09 -0700",
                    "sunset": "2022-03-12 18:03:20 -0700",
                    "max_temp": 50.95,
                    "min_temp": 26.26,
                    "conditions": "clear sky",
                    "icon": "01d"
                }
            ]
        }
    }
}
```
<hr>

## Backgrounds
Request:
```
GET /api/v1/backgrounds?location=denver,co
Content-Type: application/json
Accept: application/json
```
Example Response:
```json
status: 200
body:
{
    "data": {
        "id": null,
        "type": "image",
        "attributes": {
            "url": "https://www.pexels.com/photo/red-and-white-concrete-building-during-night-time-3751010/",
            "photographer": "Colin Lloyd",
            "photographer_url": "https://www.pexels.com/@colin-lloyd-2120291"
        }
    }
}
```
<hr>

## Users
Request:
```
POST /api/v1/users
Content-Type: application/json
Accept: application/json
{
  "email": "faker12@notreal.new",
  "password": "123ThisIsFake",
  "password_confirmation": "123ThisIsFake"
}
```
Example Response:
```json
status: 201
body:
{
    "data": {
        "id": "7",
        "type": "users",
        "attributes": {
            "email": "faker12@notreal.net",
            "api_key": "0b811cc7ad234nj817fba8b0d71542aa"
        }
    }
}
```
<hr>

## Sessions
Request:
```
POST /api/v1/sessions
Content-Type: application/json
Accept: application/json
{
  "email": "faker12@email.com",
  "password": "123ThisIsFake"
}
```
Example Response:
```json
status: 200
body:
{
    "data": {
        "id": "7",
        "type": "users",
        "attributes": {
            "email": "faker12@notreal.net",
            "api_key": "0b811cc7ad234nj817fba8b0d71542aa"
        }
    }
}
```
<hr>

## RoadTrip
Request:
```
POST /api/v1/road_trip
Content-Type: application/json
Accept: application/json
{
  "origin": "Los Angeles,CA",
  "destination": "New York,NY",
  "api_key": "0b811cc7ad234nj817fba8b0d71542aa"
}
```
Example Response:
```json
status: 200
body:
{
    "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "start_city": "Los Angeles, CA",
            "end_city": "New York, NY",
            "travel_time": "40:21:05",
            "weather_at_eta": {
                "temperature": 45.91,
                "conditions": "overcast clouds"
            }
        }
    }
}
```
