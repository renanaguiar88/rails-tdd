class Pessoa
  attr_accessor :nome, :idade
  attr_reader :status

  def feliz!
    @status = "Sentindo-se feliz!"
  end

  def triste!
    @status = "Sentindo-se triste!"
  end

  def cansado!
    @status = "Sentindo-se cansado!"
  end

end