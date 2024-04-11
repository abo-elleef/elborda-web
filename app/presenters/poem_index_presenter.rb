class PoemIndexPresenter
  attr_reader :poem
  def initialize(poem)
    @poem = poem
  end

  def to_json
    {
        id:   poem.id,
        name: poem.name,
        desc: poem.desc,
        chapters: poem.chapters.map{|chapter| ChapterPresenter.new(chapter).to_json}
    }
  end
end
