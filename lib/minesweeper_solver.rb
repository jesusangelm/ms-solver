require_relative '../config/environment'

module MinesweeperSolver
  def self.search_empty_spot(board)
    coordinates = []
    board.each_with_index do |row, index_row|
      row.each_with_index do |column, index_col|
        coordinates << { row: index_row, col: index_col } if column == ' '
      end
    end
    coordinates
  end

  def self.find_neighbors(board, row, col)
    neighbors = []
    range = (0..(board.size - 1))

    ((row - 1)..(row + 1)).each do |neigh_row|
      ((col - 1)..(col + 1)).each do |neigh_col|
        if range.include?(neigh_row) && range.include?(neigh_col)
          if neigh_row != row || neigh_col != col
            neighbors << board[neigh_row][neigh_col]
          end
        end
      end
    end
    neighbors
  end

  def self.bomb_counter(board, empty_spots)
    empty_spots.each_with_index do |loc, index|
      vecinos = find_neighbors(board, loc[:row], loc[:col])
      bombas = vecinos.find_all { |n| n == '*' }.size
      empty_spots[index][:bomb] = bombas
    end
    empty_spots
  end

  def self.find_solution(problem_board)
    empty_spot_locations = search_empty_spot(problem_board)
    bomb_count = bomb_counter(problem_board, empty_spot_locations)

    bomb_count.map { |h| problem_board[h[:row]][h[:col]] = h[:bomb].to_s }

    problem_board
  end
end
