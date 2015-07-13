# Description:
#   Tells you what the intrepid Florida Man has been up to.
#
# Dependencies:
#   'twit': '1.1.6'
#   'underscore': '1.4.4'
#
# Commands:
#   hubot floridaman me - Show random tweet from @_FloridaMan
#   hubot floridaman bomb <n> - Show <n> random tweets from @_FloridaMan
#
# Author:
#   Smitty

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

  robot.respond /floridaman me/i, (msg) -> floridaman_says msg

  robot.respond /floridaman bomb( (\d+))?/i, (msg) -> floridaman_says msg, msg.match[2] || 5
