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
  end

  def point_won(player)
    @score[player] = SCORE[@score[player]]
  end

  def current_score
    "#{@score[:player1]}-#{@score[:player2]}"
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

  it 'should score a game where player two has scored once' do
    tennis_scorer.point_won(:player2)
    expect_score_to_eq("0-15")
  end

  it 'should score a game where player two has scored twice' do
    2.times { tennis_scorer.point_won(:player2) }
    expect_score_to_eq("0-30")
  end

  it 'should score a game where player one has scored thrice' do
    3.times { tennis_scorer.point_won(:player2) }
    expect_score_to_eq("0-40")
  end
end