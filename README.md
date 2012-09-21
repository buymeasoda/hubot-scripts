# Hubot Scripts

Scripts for use with [hubot](http://hubot.github.com/)

## Translink

If you're a developer, who uses hubot, living in Queensland, and catch the train...  Then this is the hubot script for you!

Let hubot tell you then next three upcoming trains at your local station in either direction. Great for quickly checking how much time you've got before you need to rush out the door to make the next train.

### Usage

Translink uses the awkward naming of `upward` and `downward` to represent the inbound / outbound direction, so once you've configured your train station as a hubot environment variable, you can ask hubot for the times as follows:

	hubot train up
	hubot train down

And hubot will reply with the next three available trains in your specified direction:

	Trains Upward: 9 mins, 24 mins, 39 mins

### Settings

Hubot needs to told which station you want to see train times for, using the following environment variable:

	HUBOT_TRANSLINK_STATION

For example, for Central Station:

	HUBOT_TRANSLINK_STATION='central'

To find the exact string that Translink uses to represent your station name, use the following [Translink: Stops and Stations](http://jp.translink.com.au/travel-information/network-information/stops-and-stations/) search form to return your station name. Make it all lowercase and set the environment variable.