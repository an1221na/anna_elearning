class Word < ApplicationRecord
  belongs_to :category
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices, allow_destroy: true

  def correct_answer
    choices.find_by(correct: true).content
  end
end