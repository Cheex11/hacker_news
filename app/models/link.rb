require 'time'
require 'date'

class Link < ActiveRecord::Base
  has_many :comments

  validates :title, :presence => true
  validates :url, :presence => true

  def self.order_by_score
    Link.order(:score => :desc)
  end

  def modified_score
    time = Time.new
    age = ((time - self.created_at)/60/60/24).to_i
    modified_score = score + age * (-0.5)
    modified_score
  end

  def self.order_by_modified_score
    links = Link.all
    modified_links = {}
    links.each do |link|
      modified_links[link] = link.modified_score
    end
    new_order = modified_links.keys.sort {|a, b| modified_links[b] <=> modified_links[a]}
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
