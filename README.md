---
tags: google, map, api, location, todo
languages: javascript 
resources: 5
---

# Google Maps

## Objectives

1. Find the user's location using JavaScript
2. Use the user's location to render a Google map

[Here's a video](https://s3-us-west-2.amazonaws.com/readme-photos/google_map_todo.mov) of the functionality we're going for. To accomplish this todo, you will need set your latitude and longitude for the spec, create a new Firefox profile, and alter the two files in the `public/javascripts` folder. 

## Instructions

### Location Setup

If you are working on this todo at an address other than [11 Broadway, New York, NY](https://goo.gl/maps/c5T2z), find your [latitude and longitude](http://mygeoposition.com/) and replace the values in `spec/fixtures/student_position.json`. Make sure your new latitude and longitude values specify to the tens decimal place but no further (otherwise your tests might be too specific and fail). Also be sure to keep these values as strings.

### Test Setup

The testing suite for this todo needs you to make a Firefox profile called "dev" that allows location sharing for all requests from `127.0.0.1`. This will ensure that the testing suite can request your location without you having to click the "Enable Location Sharing" button an absurd number of times.

* Run `bundle install`.
* Start a background `rackup` process (type `rackup` then open a new window with `command ⌘` + `T`).
* Make sure Firefox is completely closed on your computer and enter `/Applications/Firefox.app/Contents/MacOS/firefox-bin -p` into your terminal.
* Click `Create Profile...`.
* Click `Continue`.
* Name your new profile `dev` and save it in the default location.
* On the main menu, unclick the `Use the selected profile without asking at startup` checkbox so that Firefox won't default to this dev environment.
* While `dev` is highlighted, click `Start Firefox`.
* Go to [127.0.0.1:9292/](http://127.0.0.1:9292/) in your dev profile in the Firefox browser and click on `Tools` in the nav bar.
* Click on `Page Info`
* Click on `Permissions`
* Under "Access Your Location", uncheck `Use Default` and then check the `Allow`.
* Exit Firefox and you're solid.

This todo is tested using Capybara so run `rspec` after you've completed the steps above to see where you're at.

### JavaScript

* In `fetch_location.js`, fill out `getLocation` such that it will fetch the user's longitude and latitude.
* Replace the HTML in the div with an id of `longitude` with the longitude.
* Replace the HTML in the div with an id of `latitude` with the latitude.
* Fill out the function in `insert_map` such that it accepts two arguments, longitude and latitude. This function should add a Google map to the div with an id of `map_canvas`. This map should be centered on the user's location.
* Call on the function `insertMap` just below where you retrieved the user's latitude and longitude. Remember to pass it the correct arguments.
* Run `rackup` or `shotgun` and visit [localhost:9292](http://localhost:9292/) or [localhost:9292](http://localhost:9393/) respectively to see your app in action.
* This app is tested using Capybara with Selenium WebDriver.

## Resources

* [Firefox](https://support.mozilla.org/) - [Creating a Firefox Profile](https://support.mozilla.org/en-US/kb/profile-manager-create-and-remove-firefox-profiles)
* [Find Your Lat and Lng](http://mygeoposition.com/)
* [MDN](https://developer.mozilla.org/) - [Using Geolocation](https://developer.mozilla.org/en-US/docs/Web/API/Geolocation/Using_geolocation)
* [W3Schools](http://www.w3schools.com) - [HTML5 Geolocaton](http://www.w3schools.com/html/html5_geolocation.asp)
* [Google Developers](https://developers.google.com/) - [Adding a Google Map](https://developers.google.com/maps/tutorials/fundamentals/adding-a-google-map)
