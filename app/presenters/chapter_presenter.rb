class ChapterPresenter
  attr_reader  :chapter
  def initialize(chapter)
    @chapter = chapter
  end

  def to_json
    {
        id: chapter.id.to_s,
        name: chapter.name.to_s,
        name_en: chapter.name_en.to_s,
        name_fr: chapter.name_fr.to_s,
        desc: chapter.desc.to_s,
        desc_en: chapter.desc_en.to_s,
        desc_fr: chapter.desc_fr.to_s,
        lines: chapter.lines.map {|line| LinePresenter.new(line).to_json}
    }
  end
end
