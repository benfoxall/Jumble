# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  # this outputs a pie chart image (using google chart api)
  # which will be drawn using canvas if possible
  def chart series, *options
    opts = options.first || {}
    
    opts[:width] ||= 100
    opts[:height] ||= 100
    
    # do some scaling
    total = 0
    series.each {|s| total += s}
    series.map! {|s| s.to_f / total}
    
    #rotate to 'down'
    chp = (Math::PI/2)-(Math::PI*series.first)
    
    content_tag :img, '', {
              :class => 'chart', 
              :src => "http://chart.apis.google.com/chart?cht=p&chd=t:#{series.join ','}&chs=#{opts[:width]}x#{opts[:height]}&chp=#{chp}"
            }.merge(opts)
  end
  
end
