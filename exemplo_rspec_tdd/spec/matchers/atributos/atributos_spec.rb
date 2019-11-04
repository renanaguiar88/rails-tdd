require 'pessoa'

describe 'Atributos' do
#  before(:each) do    
#    @pessoa = Pessoa.new
#  end

#  after(:each) do
#    @pessoa.nome = "Sem nome"
#    puts ">>>> #{@pessoa.inspect}"
#  end

  around(:each) do |test|
    @pessoa = Pessoa.new

    test.run

    @pessoa.nome = "Sem nome"
    puts ">>>> #{@pessoa.inspect}"
  end

  it 'have_attributes' do    
    @pessoa.nome = "Teste"
    @pessoa.idade = 20
    expect(@pessoa).to have_attributes(nome: a_string_starting_with("T"), idade: 20)
  end

  it 'have_attributes' do     
    @pessoa.nome = "Teste123"
    @pessoa.idade = 25
    expect(@pessoa).to have_attributes(nome: a_string_starting_with("T"), idade: 25)
  end
end