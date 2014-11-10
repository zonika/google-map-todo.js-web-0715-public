---
tags: google, map, api, location, todo
languages: javascript 
resources: 2
---

# Google Maps

## Objectives

1. Find the user's location using JavaScript
2. Use the user's location to render a Google map

[Here's a video](https://s3-us-west-2.amazonaws.com/readme-photos/google_map_todo.mov) of the functionality we're going for.

## Instructions

* In `fetch_location.js`, fill out `getLocation` such that it will fetch the user's longitude and latitude.
* Replace the HTML in the div with an id of `longitude` with the longitude.
* Replace the HTML in the div with an id of `latitude` with the latitude.
* Fill out the function in `insert_map` such that it accepts two arguments, longitude and latitude. This function should add a Google map to the div with an id of `map_canvas`. This map should be centered on the user's location.
* Call on the function `insertMap` just below where you retrieved the user's latitude and longitude.

## Resources

* [MDN](https://developer.mozilla.org/) - [Using Geolocation](https://developer.mozilla.org/en-US/docs/Web/API/Geolocation/Using_geolocation)
* [Google Developers](https://developers.google.com/) - [Adding a Google Map](https://developers.google.com/maps/tutorials/fundamentals/adding-a-google-map)
