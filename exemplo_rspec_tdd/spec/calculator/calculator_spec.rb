require 'calculator'

describe Calculator, "Calculadora" do
  context '#sum' do
    it 'only positive' do
      result = subject.sum(5, 7)
      expect(result).to eq(12)
    end  

    it 'w/ negative' do
      result = subject.sum(5, -7)
      expect(result).to eq(-2)
    end

    it 'only negative' do
      result = subject.sum(-5, -7)
      expect(result).to eq(-12)
    end

    xit 'w/ positive' do
      result = subject.sum(5, 7)
      expect(result).to eq(12)
    end
  end
end