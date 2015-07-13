# Description:
#   Asks if Vince is the FloridaMan
#
# Dependencies:
#   'twit': '1.1.6'
#   'underscore': '1.4.4'
#
# Commands:
#   hubot is vince the florida man - Show random tweet from @_FloridaMan
#
# Author:
#   domingusj

_ = require 'underscore'
Twit = require 'twit'
config =
  consumer_key: process.env.HUBOT_TWITTER_CONSUMER_KEY
  consumer_secret: process.env.HUBOT_TWITTER_CONSUMER_SECRET
  access_token: process.env.HUBOT_TWITTER_ACCESS_TOKEN
  access_token_secret: process.env.HUBOT_TWITTER_ACCESS_TOKEN_SECRET

module.exports = (robot) ->
  twit = new Twit config

  floridaman_says = (msg, count = 1) ->
    twit.get 'statuses/user_timeline',
      screen_name: escape('_FloridaMan')
      count: 10000
      include_rts: false
      exclude_replies: true
    , (err, reply) ->
      return msg.send "Error #{err}" if err
      messages = _.sample(reply, count)
      messages.map (message) ->
        msg.send _.unescape(message['text'])

  robot.respond /is vince the florida man/i, (msg) -> floridaman_says msg


