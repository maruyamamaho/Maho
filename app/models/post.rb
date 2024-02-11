class Post < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user, optional: true
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :sims, dependent: :destroy
    def already_simed?(post)
        self.sims.exists?(post_id: post.id)
    end
end
