describe Array.new([1, 5, 7]) do
  it '#include' do
    expect(subject).to include(1) 
    expect(subject).to include(5, 7) 
  end

  it '#contain_exactly' do
    expect(subject).to contain_exactly(1, 5, 7)     
  end

  it '#match_array' do
    expect(subject).to match_array([1, 7, 5])     
  end  
end
