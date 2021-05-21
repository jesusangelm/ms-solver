module Challenge
  module MsRequester
    URL = 'https://mine-sweeper-generator.herokuapp.com/solver'.freeze

    def self.new_board
      response = RestClient.get(URL)
      JSON.parse(response)
    end
  end
end
