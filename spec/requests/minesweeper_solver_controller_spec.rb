require 'rails_helper'

RSpec.describe 'MinesweeperSolverControllers', type: :request do
  describe 'GET /api/v1/minesweeper_solver' do
    it 'returns http success' do
      get '/api/v1/minesweeper_solver'
      expect(response).to have_http_status(:success)
    end

    it 'returns problem and solution on a json response' do
      get '/api/v1/minesweeper_solver'

      json_response = JSON.parse(response.body).deep_symbolize_keys

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(json_response.keys).to match_array(%i[problem solution])
      expect(json_response[:problem].any?).to eq(true)
      expect(json_response[:solution].any?).to eq(true)
    end
  end
end
