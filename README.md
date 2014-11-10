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

### JavaScript

To accomplish this todo, you will only need to alter the two files in the `public/javascripts` folder.  

* In `fetch_location.js`, fill out `getLocation` such that it will fetch the user's longitude and latitude.
* Replace the HTML in the div with an id of `longitude` with the longitude.
* Replace the HTML in the div with an id of `latitude` with the latitude.
* Once your geolocation function is working, it's time to set up your test suite. 

### Test Setup

The testing suite for this todo relies on the fact that you have a Firefox profile called "dev". Here's how you make one:

* Start a background `rackup` process (type `rackup` in the terminal, open a new terminal tab)
* Make sure Firefox is completely closed on your computer and enter `/Applications/Firefox.app/Contents/MacOS/firefox-bin -p` into your terminal.
* Click "Create Profile..."
* Click "Continue"
* Name your new profile "dev" and save it in the default location.
* Unclick the "User the selected profile without asking at startup" so that Firefox won't default to this dev environment.
* While `dev` is highlighted, click `Start Firefox`.
* Go to [http://127.0.0.1:9292/](http://127.0.0.1:9292/) in your dev profile in the Firefox browser and click 

### Back to JavaScript
* Fill out the function in `insert_map` such that it accepts two arguments, longitude and latitude. This function should add a Google map to the div with an id of `map_canvas`. This map should be centered on the user's location.
* Call on the function `insertMap` just below where you retrieved the user's latitude and longitude. Remember to pass it those two values as arguments.
* Run `rackup` or `shotgun` and visit [localhost:9292](http://localhost:9292/) or [localhost:9292](http://localhost:9393/) respectively to see your app in action. 

## Resources

* [MDN](https://developer.mozilla.org/) - [Using Geolocation](https://developer.mozilla.org/en-US/docs/Web/API/Geolocation/Using_geolocation)
* [W3Schools](http://www.w3schools.com) - [HTML5 Geolocaton](http://www.w3schools.com/html/html5_geolocation.asp)
* [Google Developers](https://developers.google.com/) - [Adding a Google Map](https://developers.google.com/maps/tutorials/fundamentals/adding-a-google-map)
