class Link < ActiveRecord::Base
  validates :title, :presence => true
  validates :url, :presence => true

  def self.order_by_score
    Link.order(:score => :desc)
  end
end
