class Choice < ApplicationRecord
  belongs_to :word
  has_many :answers, dependent: :destroy
  validates :content, presence: true, length: { minimum: 2, maximum: 30 }
end
