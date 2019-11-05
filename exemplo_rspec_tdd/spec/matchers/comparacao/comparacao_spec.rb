describe 'Matchers de comparação' do
  it '>' do
    expect(5).to be > 1
  end

  it '>=' do
    expect(5).to be >= 5
  end

  it '<' do
    expect(5).to be < 10
  end

  it '<=' do
    expect(5).to be <= 5
  end

  it 'be_between inclusive' do
    expect(5).to be_between(1, 5).inclusive
  end

#  it 'be_between inclusive / falhas agregadas', :aggregate_failures do    
#    expect(1).to be_between(1, 5).inclusive
#    expect(0).to be_between(1, 5).inclusive
#    expect(8).to be_between(1, 5).inclusive    
#  end

  it 'be_between inclusive / falhas agregadas' do    
    expect(1).to be_between(1, 5).inclusive
    expect(0).to be_between(1, 5).inclusive
    expect(8).to be_between(1, 5).inclusive    
  end

  it 'be_between exclusive' do
    expect(4).to be_between(1, 5).exclusive
  end

  it 'match' do
    expect("teste@teste.com.br").to match(/..@../)
  end

  it 'start_with' do
    expect("Teste Teste").to start_with("Tes")
  end

  it 'end_with' do
    expect("Teste Teste").to end_with("ste")
  end

end