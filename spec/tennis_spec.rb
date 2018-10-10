describe TennisScorer do
  it 'should score a new game where neither player has scored yet' do
    expect(score).to eq("0-0")
  end
end