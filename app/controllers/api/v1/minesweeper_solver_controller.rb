class Api::V1::MinesweeperSolverController < ApplicationController
  require_relative '../../../../lib/minesweeper_solver'

  def index
    board_to_solve = Challenge::MsRequester.new_board
    problem = Marshal.dump(board_to_solve)
    solver = MinesweeperSolver.new
    board_solved = solver.find_solution(board_to_solve)

    @response = {
      problem: Marshal.load(problem),
      solution: board_solved
    }

    respond_to do |format|
      format.html
      format.json { render json: @response }
    end
  end
end
