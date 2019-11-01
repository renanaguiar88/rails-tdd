describe 'satisfy' do
  it {
    expect(10).to satisfy('be a multiple of 2') do |x| 
      x % 2 == 0
    end
  }
  
  it {
    expect(9).to satisfy('be a multiple of 3') do |x| 
      x % 3 == 0
    end
  }
end