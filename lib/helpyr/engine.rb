module Helpyr
  class Engine < ::Rails::Engine
    initializer "helpyr.helpers" do
      ActiveSupport.on_load(:action_view) do
        include Helpyr::Translation
      end
    end
  end
end
