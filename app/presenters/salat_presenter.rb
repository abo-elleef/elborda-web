class SalatPresenter
  attr_reader :salat
  def initialize(salat)
    @salat = salat
  end

  def to_json
    {
      id: salat.id,
      name: salat.name,
      desc: salat.desc.to_s,
      textPages: salat.lines.map(&:body)
    }
  end
end

