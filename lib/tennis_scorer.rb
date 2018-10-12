class TennisScorer

  SCORE = {
      0  => 15,
      15  => 30,
      30  => 40
  }.freeze

  def initialize
    @score = {
        player1: 0,
        player2: 0
    }
    @game_state = nil
  end

  def point_won(player)
    if SCORE[@score[player]]
      @score[player] = SCORE[@score[player]]
      @game_state = "DEUCE" if deuce?
    else
      return @game_state = "PLAYER 1 WINS" if player_1_win?(player)
      return @game_state = "PLAYER 2 WINS" if player_2_win?(player)
      return @game_state = "DEUCE" if return_to_deuce?(player)
      return @game_state = "PLAYER 1 ADVANTAGE" if player_1_advantage?(player)
      return @game_state = "PLAYER 2 ADVANTAGE" if player_2_advantage?(player)
    end
  end

  def current_score
    return @game_state if @game_state

    "#{@score[:player1]}-#{@score[:player2]}"
  end

  private

  def return_to_deuce?(player)
    deuce? && ((@game_state == "PLAYER 1 ADVANTAGE" && player != :player1) || (@game_state == "PLAYER 2 ADVANTAGE" && player != :player2))
  end

  def player_2_advantage?(player)
    deuce? && player == :player2
  end

  def player_1_advantage?(player)
    deuce? && player == :player1
  end

  def player_2_win?(player)
    @score[:player1] < @score[:player2] || deuce? && @game_state == "PLAYER 2 ADVANTAGE" && player == :player2
  end

  def player_1_win?(player)
    @score[:player1] > @score[:player2] || deuce? && @game_state == "PLAYER 1 ADVANTAGE" && player == :player1
  end

  def deuce?
    @score[:player1] == 40 && @score[:player2] == 40
  end
end