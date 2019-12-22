local Colyseus = require('Scripts/lib/colyseus.client')
Game = {}
function Game:Start()
  local client = Colyseus.new("ws://rzcap:41003")
  self.rooms = {}
  client:join_or_create('battle', function(err, room)
    if err then
      return
    end
    table.insert(self.rooms, room)
  end)
end
function Game:Finish()
  for i=1, #self.rooms do
    self.rooms[i]:leave(false)
  end
end
