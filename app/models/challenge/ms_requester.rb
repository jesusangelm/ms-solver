module Challenge
  module MsRequester
    URL = 'https://mine-sweeper-generator.herokuapp.com/solver'.freeze

    def self.new_board
      response = RestClient.get(URL)
      { error: false, board: JSON.parse(response) }
    rescue Errno::ENETUNREACH => e
      { error: true, message: e }
    end
  end
end
