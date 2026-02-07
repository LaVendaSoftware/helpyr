module Helpyr
  module Translation
    ##
    # Public: Translate a model name.
    #
    # model: Model class.
    # count: Count.
    #
    # Examples:
    #
    #   <%= tm(Post) %>
    #   # => "Artigo"
    #
    #   <%= tm(Post, 2) %>
    #   # => "Artigos"
    #
    # Returns translated model.
    def translate_model_name(model, ...)
      model.model_name.human(...)
    end
    alias_method :tm, :translate_model_name

    ##
    # Public: Translate a model name pluralized.
    #
    # model: Model class.
    #
    # Examples:
    #
    #   <%= tmp(Post) %>
    #   # => "Artigos"
    #
    # Returns translated model pluralized.
    def translate_model_name_pluralized(model, **)
      translate_model_name(model, count: 2, **)
    end
    alias_method :tmp, :translate_model_name_pluralized

    ##
    # Public: Translate a model submit button.
    #
    # model: Model class.
    #
    # Examples:
    #
    #   <%= tmb(Post, :create) %>
    #   => <button name="button" type="submit" class="btn btn-primary">
    #   =>   <i class="bi bi-save2"> </i>Criar Artigo
    #   => </button>
    #
    #   <%= tmb(Post, :update) %>
    #   => <button name="button" type="submit" class="btn btn-primary">
    #   =>   <i class="bi bi-save2"> </i>Atualizar Artigo
    #   => </button>
    #
    # Returns translated model pluralized.
    def translate_model_button(model, kind)
      I18n.t("helpyr.form.button.#{kind}", model: tm(model))
    end
    alias_method :tmb, :translate_model_button

    ##
    # Public: Translate a model attribute.
    #
    # model: Model class.
    # attribute: Attribute name.
    # count: Count.
    #
    # Examples
    #
    #   <%= ta(Post, :title) %>
    #   # => "Titulo"
    #
    #   <%= ta(Post, :title, 2) %>
    #   # => "Títulos"
    #
    # Returns translated model's attribute.
    def translate_model_attribute(model, attribute, ...)
      model.human_attribute_name(attribute, ...)
    end
    alias_method :ta, :translate_model_attribute

    ##
    # Public: Translate a model enum.
    #
    # model: Model class.
    # count: Count.
    #
    # Examples:
    #
    #   <%= teo(Order, :statuses) %>
    #   # => [["Rascunho", "draft"], ["Pendente", "pending"], ["Em processamento", "processing"]]
    #
    #   <%= teo(Order, :statuses, only: ["draft", "pending"]) %>
    #   # => [["Rascunho", "draft"], ["Pendente", "pending"]]
    #
    #   <%= teo(Order, :statuses, except: ["pending"]) %>
    #   # => [["Rascunho", "draft"], ["Em processamento", "processing"]]
    #
    # Returns translated model's enum names.
    def translate_model_enum_names(model, enum, only: [], except: [])
      model.send(enum).keys.filter_map do |key|
        next if only.present? && only.exclude?(key.to_s)
        next if only.blank? && except.include?(key.to_s)

        [model.human_attribute_name("#{enum}.#{key}"), key]
      end
    end
    alias_method :teo, :translate_model_enum_names

    ##
    # Public: Translate a boolean attribute.
    #
    # value: TrueClass or FalseClass.
    #
    # Examples
    #
    #   <%= tb true %>
    #   # => "Sim"
    #
    #   <%= tb false %>
    #   # => "Não"
    #
    # Returns translated boolean's attribute.
    def translate_boolean(value)
      I18n.t("helpyr.boolean.#{value}")
    end
    alias_method :tb, :translate_boolean

    ##
    # Public: Translate a not found message.
    #
    # model: Model class.
    # gender: Gender of the model.
    #
    # Examples:
    #
    #   <%= tnf(Post, gender: :male) %>
    #   # => "Nenhum artigo foi encontrado."
    #
    #   <%= tnf(Company, gender: :female) %>
    #   # => "Nenhuma empresa foi encontrada."
    #
    # Returns translated not found message.
    def translate_not_found(model, gender:)
      I18n.t("helpyr.alerts.not_found.#{gender}", model: tm(model).downcase)
    end
    alias_method :tnf, :translate_not_found

    ##
    # Public: Translate a not found message for male model.
    #
    # model: Model class.
    #
    # Examples:
    #
    #   <%= tnfm(Post) %>
    #   # => "Nenhum artigo foi encontrado."
    #
    # Returns translated not found message for male model.
    def translate_not_found_male(model)
      tnf(model, gender: :male)
    end
    alias_method :tnfm, :translate_not_found_male

    ##
    # Public: Translate a not found message for female model.
    #
    # model: Model class.
    #
    # Examples:
    #
    #   <%= tnff(Company) %>
    #   # => "Nenhuma empresa foi encontrada."
    #
    # Returns translated not found message for female model.
    def translate_not_found_female(model)
      tnf(model, gender: :female)
    end
    alias_method :tnff, :translate_not_found_female
  end
end
