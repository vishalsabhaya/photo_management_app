class Image < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :title, presence: true, length: {maximum: 30}
  validate :image_attached?

  # display images of targeted user only
  scope :user_wise, ->(user) { where(user_id: user.id)}

  # get images descending order
  scope :order_updated_at, -> { order(updated_at: :desc)}

  private

  # if image not attached then return required error
  def image_attached?
    errors.add(:image_attached, I18n.t('E0003')) unless photo.attached?
  end

end
