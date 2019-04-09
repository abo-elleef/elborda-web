module ApplicationHelper

  def poem_link_name(poem)
    [ poem.id, poem.name.presence , poem.author.presence].compact.join(' - ')
  end
end
