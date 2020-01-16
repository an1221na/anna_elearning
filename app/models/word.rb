class Word < ApplicationRecord
  belongs_to :category
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices, allow_destroy: true
  validates :content, presence: true
  validate :has_one_correct_answer
  validate :has_unique_choices

  def correct_answer
    choices.find_by(correct: true).content
  end

  def has_one_correct_answer
    if choices.select { |choice| choice.correct? }.count != 1
      return errors.add :base, "Must have one correct choice!"
    end
  end
  
  def has_unique_choices
    if choices.uniq{ |choice| choice.content }.count < choices.length
      return errors.add :base, "Must have unique choices!"
    end
  end 

end