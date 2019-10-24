require 'string_nao_vazia'
describe String do
  describe StringNaoVazia do
    it "Não está vazia" do
      expect(subject).to eq("Texto padrão")
    end
  end
end