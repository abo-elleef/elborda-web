class ChapterPresenter
  attr_reader  :chapter
  def initialize(chapter)
    @chapter = chapter
  end

  def to_json
    {
        id: chapter.id.to_s,
        name: chapter.name.to_s,
        lines: chapter.lines.map {|line| LinePresenter.new(line).to_json}

    }
  end
end