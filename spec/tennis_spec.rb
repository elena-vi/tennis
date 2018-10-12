class TennisScorer
  def initialize
    @score = "0-0"
  end

  def point_won
    if @score == "0-0"
      @score  = "15-0"
    elsif @score == "30-0"
      @score = "40-0"
    else
      @score = "30-0"
    end
  end

  def current_score
    @score
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
    tennis_scorer.point_won
    expect_score_to_eq("15-0")
  end

  it 'should score a game where player one has scored twice' do
    2.times do
      tennis_scorer.point_won
    end
    expect_score_to_eq("30-0")
  end

  it 'should score a game where player one has scored thrice' do
    3.times do
      tennis_scorer.point_won
    end
    expect_score_to_eq("40-0")
  end
end