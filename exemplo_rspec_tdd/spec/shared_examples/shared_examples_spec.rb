require 'pessoa'

shared_examples 'status' do |status|
  it "#{status}" do
    pessoa.send("#{status}!")
    expect(pessoa.status).to eq("Sentindo-se #{status}!")
  end
end

describe 'Pessoa' do
  subject(:pessoa) {Pessoa.new}

  it_behaves_like 'status', :feliz
  it_behaves_like 'status', :triste
  it_behaves_like 'status', :cansado

#   it 'feliz' do
#     pessoa.feliz!
#     expect(pessoa.status).to eq("Sentindo-se feliz!")
#   end

#   it 'triste' do
#     pessoa.triste!
#     expect(pessoa.status).to eq("Sentindo-se triste!")
#   end

#   it 'cansado' do
#     pessoa.cansado!
#     expect(pessoa.status).to eq("Sentindo-se cansado!")
#   end
end