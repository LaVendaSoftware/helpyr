class DummyPost
  include ActiveModel::Model

  def self.model_name
    ActiveModel::Name.new(self, nil, "Post")
  end

  def self.statuses
    {
      draft: 0,
      published: 1
    }
  end
end
