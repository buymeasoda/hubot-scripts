# Description:
#   Get the next train times for any QLD train station in either direction.
#   Great for quickly checking via Hubot when the next train is due.
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_TRANSLINK_STATION
#
# Commands:
#   hubot train up - Show the next station times for upward bound trains
#   hubot train down - Show the next station times for downward bound trains
#
# Author:
#   Ian Hill

module.exports = (robot) ->
  robot.respond /train (up|down)/i, (msg) ->
    translinkStation = process.env.HUBOT_TRANSLINK_STATION
    unless translinkStation
      msg.send 'The environment variable $HUBOT_TRANSLINK_STATION needs to be set.'
      return
    direction = if msg.match[1] is 'up' then 'Upward' else 'Downward'
    msg.http('http://mobile.jp.translink.com.au/travel-information/StopsAndStations/ViewStopInformationAJAX')
      .header('Content-Type', 'application/x-www-form-urlencoded')
      .query(id: "#{translinkStation}-station", direction: direction)
      .post() (err, res, body) ->
        times = (body.match(/<b>\n.+<\/b>/g).map (time) -> time.replace(/<b>\n(.+)<\/b>/, '$1').trim())[0..2].join(', ')
        msg.send "Trains #{direction}: #{times}"