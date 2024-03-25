class WerdPresenter
  attr_reader :werd
  def initialize(werd)
    @werd = werd
  end

  def to_json
    {
      id: werd.id.to_s,
      name: werd.name,
      desc: werd.desc.to_s,
      textPages: werd.lines.map(&:body)
    }
  end
end
