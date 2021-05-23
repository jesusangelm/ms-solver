class Api::V1::MinesweeperSolverController < ApplicationController
  require_relative '../../../../lib/minesweeper_solver'

  def index
    board_request = Challenge::MsRequester.new_board
    if board_request[:board].present?
      board_to_solve = board_request[:board]
      problem = Marshal.dump(board_to_solve)
      solver = MinesweeperSolver.new
      board_solved = solver.find_solution(board_to_solve)

      @response = {
        problem: Marshal.load(problem),
        solution: board_solved
      }
    else
      @response = { problem: [], solution: [] }
    end
    render json: @response, status: 200
  end
end
