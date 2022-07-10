class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  validates :content, presence: true, length: { minimum: 10 }
  validates :category, presence: true

  belongs_to :user

  has_one_attached :image

  def self.search(query)
    if query.present?
      where("title ILIKE ? OR category ILIKE ?", "%#{query}%", "%#{query}%")
    else
      all
    end
  end
end
