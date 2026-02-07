RSpec.describe Helpyr::PageTitle do
  include_context "when have a view context"

  describe "#page_title" do
    it "returns empty when nothing is provided" do
      expect(view.page_title).to eq("")
    end

    it "uses title content" do
      view.content_for(:title, "Dashboard")

      expect(view.page_title("Helpyr"))
        .to eq("Dashboard » Helpyr")
    end

    it "prioritizes turbo_native_title" do
      view.content_for(:title, "Dashboard")
      view.content_for(:turbo_native_title, "Turbo")

      expect(view.page_title("Helpyr"))
        .to eq("Turbo » Helpyr")
    end

    it "accepts multiple segments" do
      view.content_for(:title, "Dashboard")

      expect(view.page_title("Admin", "Helpyr"))
        .to eq("Dashboard » Admin » Helpyr")
    end

    it "removes blank segments" do
      view.content_for(:title, "Dashboard")

      expect(view.page_title("", nil, "Helpyr"))
        .to eq("Dashboard » Helpyr")
    end
  end
end
