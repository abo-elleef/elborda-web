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

  def mobile?
    agent = request.user_agent
    return "tablet" if agent =~ /(tablet|ipad)|(android(?!.*mobile))/i
    return "mobile" if agent =~ /Mobile/
    return "desktop"
  end

  def app_store_icon
    'app_store.png'
    # mobile?  ? 'app_store.png' : 'app_store.svg'
  end

  def play_store_icon
    'play_store.png'
    # mobile?  ? 'play_store.png' : 'play_store.svg'
  end

  def dark_mode?
    params[:dark_mode] == 'true'
  end
end
