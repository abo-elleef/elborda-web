class MobilePresenter
  attr_reader :poem

  def initialize(poem)
    @poem = poem
  end

  def present
    {
        id: poem.id,
        name: poem.name,
        author: poem.author,
        desc: poem.desc,
        chapters: poem.chapters.map { |chapter| ChapterPresenter.new(chapter).to_json }

    }
  end
end


# chapters: poems.lines.each_slice(poem.chapter_size.presence || Poem::DEFAULT_CHAPTER_SIZE)