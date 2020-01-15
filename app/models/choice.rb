class Choice < ApplicationRecord
  belongs_to :word
  validates :content, presence: true, length: { minimum: 2, maximum: 30 }
end
