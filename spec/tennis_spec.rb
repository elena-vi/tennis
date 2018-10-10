class TennisScorer

  def point_won

  end

  def current_score
    "0-0"
  end
end

describe TennisScorer do
  it 'should score a new game where neither player has scored yet' do

    tennis_scorer  = TennisScorer.new
    score = tennis_scorer.current_score

    expect(score).to eq("0-0")
  end

  it 'should score a game where player one has scored once' do

    tennis_scorer  = TennisScorer.new
    tennis_scorer.point_won
    score = tennis_scorer.current_score

    expect(score).to eq("15-0")
  end
end