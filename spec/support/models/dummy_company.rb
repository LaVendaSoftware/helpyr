class DummyCompany
  include ActiveModel::Model

  def self.model_name
    ActiveModel::Name.new(self, nil, "Company")
  end
end
