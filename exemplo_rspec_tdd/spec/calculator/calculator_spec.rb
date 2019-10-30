require 'calculator'

describe Calculator, "Calculadora" do

  context '#div' do
    it 'divide by 0' do      
      expect{subject.div(3, 0)}.to raise_error(ZeroDivisionError)
      expect{subject.div(3, 0)}.to raise_error("divided by 0")
      expect{subject.div(3, 0)}.to raise_error(ZeroDivisionError, "divided by 0")
      expect{subject.div(3, 0)}.to raise_error(/divided/)
    end
  end

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