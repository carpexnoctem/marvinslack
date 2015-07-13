# Description:
#   Gives a random Office quote from @officequotesnet
#
# Dependencies:
#   'twit': '1.1.6'
#   'underscore': '1.4.4'
#
# Commands:
#   hubot office quote me - Show random tweet from @officequotesnet
#   hubot office bomb <n> - Show <n> random tweets from @officequotesnet
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

  officequote_says = (msg, count = 1) ->
    twit.get 'statuses/user_timeline',
      screen_name: escape('officequotesnet')
      count: 10000
      include_rts: false
      exclude_replies: true
    , (err, reply) ->
      return msg.send "Error #{err}" if err
      messages = _.sample(reply, count)
      messages.map (message) ->
        msg.send _.unescape(message['text'])

  robot.respond /office quote me/i, (msg) -> officequote_says msg

  robot.respond /office bomb( (\d+))?/i, (msg) -> officequote_says msg, msg.match[2] || 5
