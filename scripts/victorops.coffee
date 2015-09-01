# Description:
#   Do something when an alert is received on the timeline
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   victorops alert <alert_json>

TextMessage = require('hubot').TextMessage

module.exports = (robot) ->
    robot.respond /VictorOps alert (.*)/i, (msg) ->
        alert = JSON.parse msg.match[1]
        for annotation in alert.ANNOTATIONS when annotation[0] == "HUBOT COMMAND"
            command = alert[annotation[1]]
            user = robot.brain.userForId "VictorOps"
            console.log "Found hubot command in annotation: #{command}"
            msg.send "Auto running command from annotation '#{command}'"
            robot.receive new TextMessage user, "hubot #{command}"
