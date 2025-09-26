module AttributeTranslations
  extend ActiveSupport::Concern

  def name(locale: I18n.locale)
    read_attribute("name_#{locale}") || read_attribute("name")
  end

  def desc(locale: I18n.locale)
    read_attribute("desc_#{locale}") || read_attribute("desc")
  end
end
