require 'string_nao_vazia'

describe 'Classes' do
  it 'be_instance_of' do
    expect(10).to be_instance_of(Integer)
  end

  it 'be_kind_of' do
    expect(StringNaoVazia.new).to be_kind_of(String)
  end

  it 'respond_to' do
    expect("Teste").to respond_to(:size)
  end

  it 'be_a / be_an' do
    expect(StringNaoVazia.new).to be_a(String)
    expect(StringNaoVazia.new).to be_an(String)
  end
end