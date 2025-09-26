class PoemShowPresenter
  attr_reader :poem
  def initialize(poem)
    @poem = poem
  end

  def to_json
    {
        id: poem.id,
        name: poem.name,
        name_en: poem.name_en.to_s,
        name_fr: poem.name_fr.to_s,
        desc: poem.desc,
        desc_en: poem.desc_en.to_s,
        desc_fr: poem.desc_fr.to_s,
        chapters: poem.chapters.order(id: :asc).map{|chapter| ChapterPresenter.new(chapter).to_json}
    }
  end
end