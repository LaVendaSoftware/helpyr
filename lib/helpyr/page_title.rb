module Helpyr
  module PageTitle
    def page_title(*segments)
      [
        content_for(:turbo_native_title).presence ||
          content_for(:page_title).presence ||
          content_for(:title).presence,
        *segments.compact_blank
      ].compact.join(" » ")
    end
  end
end
