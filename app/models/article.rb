class Article < ApplicationRecord
  before_create :create_slug

  def to_param
    "#{slug}"
  end

  def create_slug
    self.slug=self.slug.parameterize
  end
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 5}
  validates :slug, presence: true, length: {minimum: 5, maximum: 30}, uniqueness: true

end
