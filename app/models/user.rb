class User < ApplicationRecord
  before_save { email.downcase! }

  validates :name, presence: true, length: { minimum: 2, maximum: 30 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  validates :email, presence: true, length: {minimum: 10, maximum: 30 },
              format: { with: VALID_EMAIL_REGEX },
              uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, length: { minimum: 4 }, allow_nil: true

  mount_uploader :image, ImageUploader

  has_many :active_relationships, class_name: "Relationship",
          foreign_key: "follower_id",
          dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  
  has_many :passive_relationships, class_name:  "Relationship",
          foreign_key: "followed_id",
          dependent:   :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :lessons, dependent: :destroy
  


  def active_relationships
    Relationship.where(follower_id: id)
  end

  def passive_relationships
    Relationship.where(followed_id: id)
  end

  def followers
    ids = passive_relationships.pluck(:follower_id)
    User.where(id: ids)
  end
  
  def following
    ids = active_relationships.pluck(:followed_id)
    User.where(id: ids)
  end

  # ユーザーをフォローする
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # ユーザーのフォロー解除
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end

  def relationship(other_user)
    active_relationships.find_by(
      followed_id: other_user.id
    )
  end

  def lesson_taken(cat_id)
    lesson = lessons.find_by(category_id: cat_id)
  end

end
