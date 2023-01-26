# Skydiving-app

The aim of this app was to learn the basics of **SwiftUi** in 4 days.

----

Here is a short video of the app in action:

https://user-images.githubusercontent.com/64603276/210509152-39df70b7-10c5-4b70-8d39-ee42b39ebd35.mp4

----

As a skydiver, one of our main concern is to know if the weather makes skydiving possible or not. 

It depends of three criteria :
* **Wind strength:** it must be inferior to 35km/h
* **Visibility:** it must be superior to 4km
* **Lack of rain**

I used the free API from [OpenWeather](https://openweathermap.org/).

This app tells you if skydiving is possible in your dropzone for the next 4 days by giving you a short explanation on the weather as well as the key metrics (temperature, visibility, wind strength and wind orientation).

Please note that the app uses data from OpenWeather for a given day at 12 o'clock. It means that if you use the app today at 1PM, you won't get today's weather.

You can choose your dropzone among 36 dropzones in France. I hardcoded them using the [FFP website](https://www.ffp.asso.fr/ou-pratiquer/liste-de-toutes-les-structures-ffp/) and entered the city next to them in OpenWeather to have the longitude and latitude.
