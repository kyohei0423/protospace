class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :captured_images
  has_many :likes
  has_many :comments

  has_one :main_image, -> { where(status: 0) }, class_name: "CapturedImage"

  acts_as_taggable

  #kaminari
  paginates_per 8

  def reject_sub_images(attributed)
    attributed['content'].blank?
  end

  MAXMUN_IMAGE_NUM = 3
  def set_sub_thumbnails
    sub_images = captured_images.sub
    MAXMUN_IMAGE_NUM.times { |i| sub_images[i] ||= captured_images.build(status: "sub") }
    sub_images
  end

  def posted_date
  end

  def liked_by?(user)
    likes.find_by(user_id: user)
  end
end
