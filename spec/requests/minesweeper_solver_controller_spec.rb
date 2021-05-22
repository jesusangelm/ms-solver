require 'rails_helper'

RSpec.describe 'MinesweeperSolverControllers', type: :request do
  describe 'GET /api/v1/minesweeper_solver' do
    it 'returns http success' do
      get '/api/v1/minesweeper_solver'
      expect(response).to have_http_status(:success)
    end
  end
end
