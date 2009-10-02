# encoding: utf-8
module BaseHelper
  def list_wiki_categories
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

      output += "<li#{cls}>" + link_to(c[:title], wiki_path(c[:id])) + "</li>\n"
    end

    return output
  end

  def dttm t
    "#{t.day}. #{t.month}. #{t.year} #{t.strftime('%H:%M')}"
  end

  def dt d
    "#{d.day}. #{d.month}. #{d.year}"
  end

  def statistics
    if RAILS_ENV == 'production'
      return <<EOF
<!-- Customized Google Analytics tracking code by H1.cz - ver. 4.02 -->
<script type="text/javascript" src="/javascripts/ga-set.js"></script>
<script type="text/javascript"><!--
var pageTracker = _ga._getTracker('UA-10242946-5', '.www.ipv6portal.cz');
pageTracker._trackPageview();
//--></script>

<!-- Piwik -->
<script type="text/javascript">
var pkBaseURL = (("https:" == document.location.protocol) ? "https://stats.ipv6portal.cz/" : "http://stats.ipv6portal.cz/");
document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
</script><script type="text/javascript">
try {
  var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 1);
  piwikTracker.trackPageView();
  piwikTracker.enableLinkTracking();
} catch( err ) {}
</script>
<!-- End Piwik Tag -->

EOF
    end
  end
end
