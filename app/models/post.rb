class Post < ActiveRecord::Base
  attr_accessible :title, :content, :is_published, :slug

  scope :recent, order: "created_at DESC", limit: 5

  before_save :titleize_title
  before_save :set_slug

  validates_presence_of :title, :content

  private

  def titleize_title
    self.title = title.titleize
  end

  def set_slug
    self.slug = title.gsub(/\W/, " ").downcase.rstrip.gsub(" ", "-")
  end

end