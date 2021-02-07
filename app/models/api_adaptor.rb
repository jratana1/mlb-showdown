class ApiAdaptor < ApplicationRecord
    API_HOST = "https://statsapi.mlb.com/api/v1"
    SEARCH_PATH = "/v3/businesses/search"
    TEAMS_PATH = "/teams/{id}"
    ROSTER_PATH = "/teams/{id}/roster/depthChart"
    PLAYER_PATH = "/people/{id}"
    BATTER_STATS_PATH = "/people/{id}/stats?stats=season&group=hitting"
    PITCHING_STATS_PATH = "/people/{id}/stats?stats=season&group=pitching"
    SEARCH_LIMIT = 50
end