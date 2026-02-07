RSpec.configure do |config|
  config.include Helpyr::Translation

  config.before(:suite) do
    I18n.load_path += Dir[File.join(__dir__, "../locales/**/*.yml")]
    I18n.backend.load_translations
    I18n.available_locales = ["en", "pt-BR"]
    I18n.enforce_available_locales = false

    # I18n.backend.store_translations(:"pt-BR", {
    #   activemodel: {
    #     models: {
    #       post: {
    #         one: "Artigo",
    #         zero: "Artigos",
    #         other: "Artigos"
    #       },
    #       company: {
    #         one: "Empresa",
    #         zero: "Empresas",
    #         other: "Empresas"
    #       }
    #     },
    #     attributes: {
    #       post: {
    #         title: "Título",
    #         content: "Conteúdo",
    #         status: "Status"
    #       },
    #       "post/statuses": {
    #         draft: "Rascunho",
    #         published: "Publicado"
    #       },
    #       company: {
    #         name: "Nome"
    #       }
    #     }
    #   }
    # })
  end

  config.around do |example|
    I18n.with_locale("pt-BR") do
      example.run
    end
  end
end
