module ApplicationHelper
  include Pagy::Frontend


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


  def poem_image(poem)
    return '' if poem.blank?

    "/#{(poem.id % 12) + 1}.webp"
  end

  def app_store_icon
    'app_store.png'
    # mobile?  ? 'app_store.png' : 'app_store.svg'
  end

  def play_store_icon
    'play_store.png'
    # mobile?  ? 'play_store.png' : 'play_store.svg'
  end

  def award_titles
    awrad.keys
  end


  def awrad
    {
      "مقدمة": [1,15],
      "خاتم الصلاوات": [17,5] ,
      "الأساس": [22,1],
      "الورد اللطيف": [23,13],
      "التحصين الشريف": [37,5],
      "الحزب الكبير": [43,9],
      "اَلحزْبُ اَلْصَّغِيرُ":[53,3],
      "الَصَّلاَةُ المحَمَّدِيةُ":[57,2],
      "صَّــلاَةُإبنِ بَشِـيشُ":[59,4],
      "الحزب السيفي":[63,32],
      "الحزب المغني":[95,8],
      "حزب البحر": [103, 8],
      "حزب النصر المبارك": [111,6],
      'التوسل': [117,8],
      "توسل السادة البرهامية":[125,16],
      "السلسلة الصغيرة للمشايخ":[141,2],
      "السلسلة الكبيرة للمشايخ":[143,4],
      "الأوراد المربوطة": [147,2],
      "فواتح الحضرة":[149, 6],
      "ورد الامام النووي":[155,10],
      "صلاة سيدي أحمد البدوي":[165,2],
      "صلوات و أدعية":[167,2]
    }
  end

  def award_pages(title)
    array = awrad[title.to_sym]
    (array.first..(array.first+array.last-1)).to_a
  end
end
