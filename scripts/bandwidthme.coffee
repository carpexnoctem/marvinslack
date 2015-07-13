# Description:
# Return a link to the bld-corpfw-01 outside interface cacti graph
#
# Dependencies:
#
# Commands:
#   hubot are we busy, hubot bandwidthme, or hubot bandwidth me 
#
# Author:
#   jds

module.exports = (robot) ->
  cacti_graph = [
                  "https://bld-cacti-01.f4tech.com/cacti/graph_image.php?action=view&local_graph_id=1283&rra_id=1&ext=.png"
                  ]

  robot.respond /are we busy|bandwidthme|bandwidth me/i, (msg) ->
    msg.send "You're always too busy for me, but: " + cacti_graph
