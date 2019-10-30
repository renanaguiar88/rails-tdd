describe 'Matchers de igualdade' do
  it '#equal - Testa se é o mesmo objeto' do
    x = "ruby"
    y = "ruby"
    expect(x).not_to equal(y)
  end

  it '#be - Testa se é o mesmo objeto' do
    x = "ruby"
    y = "ruby"
    expect(x).not_to be(y)
  end

  it '#eql - Testa se é o mesmo valor' do
    x = "ruby"
    y = "ruby"
    expect(x).to eql(y)
  end

  it '#eq - Testa se é o mesmo valor' do
    x = "ruby"
    y = "ruby"
    expect(x).to eq(y)
  end
end
