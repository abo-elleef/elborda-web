module ApplicationHelper

  def poem_link_name(poem)
    [ poem.name.presence , poem.author.presence].compact.join(' - ')
  end


  def sharing_title poem
    poem.blank? ? 'البردة و المدائح ' : poem_link_name(poem)
  end

  def sharing_desc poem
    poem.blank? ? 'قصائد مدح المصطفي صلي الله عليه وسلم و اشهرها بردة المديح للامام محمد البصيري ' : @poem.desc
  end
end
