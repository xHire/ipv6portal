# encoding: utf-8
module Database::BaseHelper
  def list_db_categories
    output = ''

    for c in @categories
      cls = ''
      if c[:id] == @selected_category
        cls += "active"
      elsif @categories[@categories.size - 1] == c
        cls += " " unless cls.empty?
        cls += "last"
      end
      cls = " class=\"#{cls}\"" unless cls.empty?

      output += "<li#{cls}>" + link_to(c[:title], url_for(:controller => "database/#{c[:type]}", :action => 'list', :type => c[:id])) + "</li>\n"
    end

    return output
  end

  def status_string status
    case status
      when 0, false
        'bez zájmu'
      when 1, true
        'podporuje'
      when 2
        'v plánu'
      else
        '???'
    end
  end

  def status_class status
    case status
      when 0, false
        'negative'
      when 1, true
        'positive'
      when 2
        'planned'
      else
        ''
    end
  end
end
