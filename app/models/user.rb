class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :followed_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :follower_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :followed, through: :followed_relationships, source: :followed
  has_many :followers, through: :follower_relationships, source: :follower

  def ordered_posts
    posts.order(created_at: :desc)
  end

  def follows?(other_user)
    followed_relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    followed_relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    followed_relationships.find_by(followed_id: other_user.id).destroy
  end
end
