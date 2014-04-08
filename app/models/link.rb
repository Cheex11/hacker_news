require 'time'
require 'date'

class Link < ActiveRecord::Base
  has_many :comments

  validates :title, :presence => true
  validates :url, :presence => true

  def self.order_by_score
    Link.order(:score => :desc)
  end

  def age
    time = Time.new
    age = time - self.created_at


    result = ''
    if age < (60*60)
      result = "#{(age/60).to_i} minutes"
    elsif age < (60*60*24)
      result = "#{(age/60/60).to_i} hours"
    else
      result = "#{(age/60/60/24).to_i} days"
    end
    result
  end
end
