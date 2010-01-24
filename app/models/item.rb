class Item < ActiveRecord::Base
  belongs_to :cause
  validates_presence_of :title
  validates_presence_of :price
  validates_presence_of :description
  validates_presence_of :cause_id
  validates_associated :cause
  
  
  
  def google_chart_data
    a = ((price - retained_cost) * 100) / price
    b = ((retained_cost) * 100) / price 
    "t:#{a},#{b}"
  end
end
