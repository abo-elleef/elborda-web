class MobilePresenter
  attr_reader :poem

  def initialize(poem)
    @poem = poem
  end

  def present
    {
        id: poem.id.to_s,
        name: poem.name.to_s,
        author: poem.author.to_s,
        desc: poem.desc.to_s,
        chapters: poem.chapters.map { |chapter| ChapterPresenter.new(chapter).to_json }

    }
  end
end


# chapters: poems.lines.each_slice(poem.chapter_size.presence || Poem::DEFAULT_CHAPTER_SIZE)