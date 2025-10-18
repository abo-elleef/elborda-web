class MobilePresenter
  attr_reader :poem

  def initialize(poem)
    @poem = poem
  end

  def present
    {
        id: poem.id,
        name: poem.name.to_s,
        author: poem.author.to_s,
        desc: poem.desc.to_s,
        chapters: poem.chapters.map { |chapter| ChapterPresenter.new(chapter).to_json }

    }
  end
end
