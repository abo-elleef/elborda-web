class LinkPresenter
  attr_reader :link
  def initialize(link)
    @link = link
  end

  def to_json
    {
      id: link.id.to_s,
      link: link.link,
      source: link.source
    }
  end
end