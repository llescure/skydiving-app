# Skydiving-app

The aim of this app was to learn the basics of **SwiftUi** in more or less 3 days.

----

As a skydiver, one of our main concern is to know if the weather makes skydiving possible or not. 

It depends of three criteria :
* **Wind strength:** it must be inferior to 35km/h
* **Visibility:** it must be superior to 4km
* **Lack of rain**

I used the free API from [OpenWeather](https://openweathermap.org/).

This app tells you if skydiving is possible in your dropzone for the next 4 days by giving you a short explanation on the weather as well as the key metrics (temperature, visibility, wind strength and wind orientation).

You can choose your dropzone among 36 dropzones in France. I hardcoded them using the [FFP website](https://www.ffp.asso.fr/ou-pratiquer/liste-de-toutes-les-structures-ffp/) and entered the city next to them in OpenWeather to have the longitude and latitude.

----

I used the following views:
<p align="center">
 <img src="https://github.com/llescure/skydiving-app/blob/main/skydiving%20weather/Preview%20Content/Preview%20Assets.xcassets/Final%20result/Finished%20Home%20Page.imageset/Simulator%20Screen%20Shot%20-%20iPhone%2014%20Pro%20-%202023-01-02%20at%2023.25.21.png" width="350" title="home page">
 <img src="https://github.com/llescure/skydiving-app/blob/main/skydiving%20weather/Preview%20Content/Preview%20Assets.xcassets/Final%20result/Autocomplete.imageset/Simulator%20Screen%20Shot%20-%20iPhone%2014%20Pro%20-%202023-01-02%20at%2023.25.44.png" width="350" title="autocomplete">
</p>
