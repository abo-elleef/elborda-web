class DalaelPresenter
  attr_reader :dalael
  def initialize(dalael)
    @dalael = dalael
  end

  def to_json
    {
      id: dalael.id,
      name: dalael.name,
      name_en: dalael.name_en.to_s,
      name_fr: dalael.name_fr.to_s,
      desc: dalael.desc.to_s,
      desc_en: dalael.desc_en.to_s,
      desc_fr: dalael.desc_fr.to_s,
      lines: dalael.lines.map(&:body),
      links: dalael.links.map {|link| LinkPresenter.new(link).to_json}
    }
  end
end

