RSpec.describe Helpyr::Translation do
  include described_class

  describe "#tm" do
    it "translates model name" do
      expect(tm(DummyPost)).to eq("Artigo")
    end
  end

  describe "#tmp" do
    it "pluralizes model name" do
      expect(tmp(DummyPost)).to eq("Artigos")
    end
  end

  describe "#ta" do
    it "translates attribute" do
      expect(ta(DummyPost, :title)).to eq("Título")
    end
  end

  describe "#teo" do
    it "returns enum translations" do
      expect(teo(DummyPost, :statuses)).to eq([
        ["Rascunho", :draft],
        ["Publicado", :published]
      ])
    end

    it "filters with only" do
      expect(teo(DummyPost, :statuses, only: ["draft"]))
        .to eq([["Rascunho", :draft]])
    end

    it "filters with except" do
      expect(teo(DummyPost, :statuses, except: ["draft"]))
        .to eq([["Publicado", :published]])
    end
  end

  describe "#tb" do
    it "translates true" do
      expect(tb(true)).to eq("Sim")
    end

    it "translates false" do
      expect(tb(false)).to eq("Não")
    end
  end

  describe "#tmb" do
    it "builds create button text" do
      expect(tmb(DummyPost, :create)).to eq("Criar Artigo")
    end
  end

  describe "#tnf" do
    it "translates not found male" do
      expect(tnf(DummyPost, gender: :male))
        .to eq("Nenhum artigo foi encontrado.")
    end

    it "translates not found female" do
      expect(tnf(DummyCompany, gender: :female))
        .to eq("Nenhuma empresa foi encontrada.")
    end
  end
end
