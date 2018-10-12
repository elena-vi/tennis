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
    elsif @score[:player1] > @score[:player2]
      @game_state = "PLAYER 1 WINS"
    end
  end

  def current_score
    return @game_state if @game_state
    return "DEUCE" if deuce?
    return "PLAYER 1 ADVANTAGE" unless @score[:player1]
    return "PLAYER 2 ADVANTAGE" unless @score[:player2]

    "#{@score[:player1]}-#{@score[:player2]}"
  end

  private

  def deuce?
    @score[:player1] == 40 && @score[:player2] == 40
  end
end

describe TennisScorer do

  def expect_score_to_eq(expected_score)
    expect(tennis_scorer.current_score).to eq(expected_score)
  end

  let(:tennis_scorer) do
    tennis_scorer = TennisScorer.new
  end

  it 'should score a new game where neither player has scored yet' do
    expect_score_to_eq("0-0")
  end

  it 'should score a game where player one has scored once' do
    tennis_scorer.point_won(:player1)
    expect_score_to_eq("15-0")
  end

  it 'should score a game where player one has scored twice' do
    2.times { tennis_scorer.point_won(:player1) }
    expect_score_to_eq("30-0")
  end

  it 'should score a game where player one has scored thrice' do
    3.times { tennis_scorer.point_won(:player1) }
    expect_score_to_eq("40-0")
  end

  it 'should score a game where player one has scored four times' do
    4.times { tennis_scorer.point_won(:player1) }
    expect_score_to_eq("PLAYER 1 WINS")
  end

  it 'should score a game where player two has scored once' do
    tennis_scorer.point_won(:player2)
    expect_score_to_eq("0-15")
  end

  it 'should score a game where player two has scored twice' do
    2.times { tennis_scorer.point_won(:player2) }
    expect_score_to_eq("0-30")
  end

  it 'should score a game where player two has scored thrice' do
    3.times { tennis_scorer.point_won(:player2) }
    expect_score_to_eq("0-40")
  end

  it 'should score a game where both players have scored thrice' do
    3.times do
      tennis_scorer.point_won(:player1)
      tennis_scorer.point_won(:player2)
    end
    expect_score_to_eq("DEUCE")
  end

  it 'should score a game where player one have scored once after deuce' do
    3.times do
      tennis_scorer.point_won(:player1)
      tennis_scorer.point_won(:player2)
    end
    tennis_scorer.point_won(:player1)
    expect_score_to_eq("PLAYER 1 ADVANTAGE")
  end

  it 'should score a game where player two have scored once after deuce' do
    3.times do
      tennis_scorer.point_won(:player1)
      tennis_scorer.point_won(:player2)
    end
    tennis_scorer.point_won(:player2)
    expect_score_to_eq("PLAYER 2 ADVANTAGE")
  end
end