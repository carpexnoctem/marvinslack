# Description:
#   gets tweet from user
#
# Dependencies:
#   "twit": "1.1.6"
#   "underscore": "1.4.4"
#
# Configuration:
#   HUBOT_TWITTER_CONSUMER_KEY
#   HUBOT_TWITTER_CONSUMER_SECRET
#   HUBOT_TWITTER_ACCESS_TOKEN
#   HUBOT_TWITTER_ACCESS_TOKEN_SECRET
#
# Commands:
#   hubot twitter <twitter username> - Show last tweet from <twitter username>
#   hubot twitter <twitter username> <n> - Cycle through tweet with <n> starting w/ latest
#
# Author:
#   KevinTraver
#

_ = require "underscore"
Twit = require "twit"
config =
  consumer_key: 'bCEBOb0l73eIU0wI0MjqxY04V'
  consumer_secret: 'zjzUQTv6vCwsTmn6oEhdsaZcFYiZmO3weXGlTaPnMH3veyHWbE'
  access_token: '487895536-aARjpLIjhO1S1nGl58z4oOpKPeWZqOPAikh3OL4j'
  access_token_secret: 'Bhcz41Z2Do7IHZfHT29ZH2Hj1d88cCPyLYakqoyHR0cCM'

module.exports = (robot) ->
  twit = undefined

  robot.respond /(twitter|lasttweet)\s+(\S+)\s?(\d?)/i, (msg) ->
    unless config.consumer_key
      msg.send "Please set the HUBOT_TWITTER_CONSUMER_KEY environment variable."
      return
    unless config.consumer_secret
      msg.send "Please set the HUBOT_TWITTER_CONSUMER_SECRET environment variable."
      return
    unless config.access_token
      msg.send "Please set the HUBOT_TWITTER_ACCESS_TOKEN environment variable."
      return
    unless config.access_token_secret
      msg.send "Please set the HUBOT_TWITTER_ACCESS_TOKEN_SECRET environment variable."
      return

    unless twit
      twit = new Twit config

    username = msg.match[2]
    if msg.match[3] then count = msg.match[3] else count = 1

    twit.get "statuses/user_timeline",
      screen_name: escape(username)
      count: count
      include_rts: false
      exclude_replies: true
    , (err, reply) ->
      return msg.send "Error" if err
      return msg.send _.unescape(_.last(reply)['text']) if reply[0]['text']
