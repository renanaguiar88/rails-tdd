describe (1..5), 'Ranges' do
  it '#cover' do
    expect(subject).not_to cover(0, 6)
  end
end