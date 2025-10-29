class SalatPresenter
  attr_reader :salat
  def initialize(salat)
    @salat = salat
  end

  def to_json
    {
      id: salat.id,
      name: salat.name,
      name_en: salat.name_en.to_s,
      name_fr: salat.name_fr.to_s,
      desc: salat.desc.to_s,
      desc_en: salat.desc_en.to_s,
      desc_fr: salat.desc_fr.to_s,
      lines: salat.lines.map(&:body),
      links: salat.links.map { |link| LinkPresenter.new(link).to_json }
    }
  end
end

