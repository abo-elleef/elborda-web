class DalaelPresenter
  attr_reader :dalael
  def initialize(dalael)
    @dalael = dalael
  end

  def to_json
    {
      id: dalael.id,
      name: dalael.name,
      desc: dalael.desc.to_s,
      textPages: dalael.lines.map(&:body)
    }
  end
end

