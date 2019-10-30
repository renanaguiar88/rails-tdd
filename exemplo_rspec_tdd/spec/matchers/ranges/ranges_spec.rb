describe (1..5), 'Ranges' do
  it '#cover' do
    expect(subject).not_to cover(0, 6)    
  end

  it {is_expected.to cover(1, 2)}
  it {is_expected.not_to cover(10, 20)}
end