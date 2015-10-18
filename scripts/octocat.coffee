# Description:
#   None
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot octocat
#
# Author:
#   domingusj

module.exports = (robot) ->
  robot.respond /octocat/i, (msg) ->
    octocat msg

octocat = (msg) ->
  msg
    .http('http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&num=10&q=http://feeds.feedburner.com/Octocats')
      .get() (err, res, body) ->
        octocats = JSON.parse(body)
        random = Math.floor(Math.random() * octocats.responseData.feed.entries.length)
        text = octocats.responseData.feed.entries[random].content
        text = text[0..text.indexOf('<img')-1]
        msg.send text
