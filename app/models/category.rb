class Category < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  has_many :words, dependent: :destroy

  def number_of_words
    Word.where(category_id: id)
  end
end
