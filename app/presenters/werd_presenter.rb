class WerdPresenter
  attr_reader :werd
  def initialize(werd)
    @werd = werd
  end

  def to_json
    {
      id: werd.id,
      name: werd.name,
      name_en: werd.name_en.to_s,
      name_fr: werd.name_fr.to_s,
      desc: werd.desc.to_s,
      desc_en: werd.desc_en.to_s,
      desc_fr: werd.desc_fr.to_s,
      lines: werd.lines.map(&:body),
      links: werd.links.map { |link| LinkPresenter.new(link).to_json }
    }
  end
end
