RSpec.shared_context "when have a view context" do
  let(:view) do
    ActionView::Base.empty.tap do |v|
      v.extend Helpyr::PageTitle

      # stub do app_name (já que seu helper chama isso)
      def v.app_name
        "Helpyr"
      end
    end
  end
end
