class ApiAdaptor < ApplicationRecord
    API_HOST = "https://statsapi.mlb.com/api/v1"
    TEAMS_PATH = "/teams/{id}"
    ROSTER_PATH = "/teams/{id}/roster/depthChart"
    PLAYER_PATH = "/people/{id}"
    BATTER_STATS_PATH = "/people/{id}/stats?stats=season&group=hitting"
    PITCHING_STATS_PATH = "/people/{id}/stats?stats=season&group=pitching"
    PLAYERS_INDEX_PATH = "/sports/1/players/"
    FIELDS = "?fields=people,id,firstName,lastName,primaryPosition,code,name,type,abbreviation"

def self.players()
    url = "#{API_HOST}#{PLAYERS_INDEX_PATH}#{FIELDS}"
    response = HTTP.get(url)
    response.parse["people"]
end

def self.player_hash(hash)
    @player_hash = {}
    @player_hash[:mlb_id] = hash["id"]
    @player_hash[:firstName] = hash["firstName"]
    @player_hash[:lastName] = hash["lastName"]
    @player_hash[:position] = hash["primaryPosition"]["abbreviation"]
    @player_hash
end

def self.create_players()
    data = ApiAdaptor.players()

    data.each do |player| 
        if !Player.find_by_mlb_id(["id"])
            Player.create(ApiAdaptor.player_hash(player))
        end
    end
end

end