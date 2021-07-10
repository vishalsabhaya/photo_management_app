class Image < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :title, presence: true, length: {maximum: 30}
  validate :image_attached?

  scope :user_wise, ->(user) { where(user_id: user.id)}
  scope :order_updated_at, -> { order(updated_at: :desc)}

  private
  def image_attached?
    errors.add(:image_attached, I18n.t('E0003')) unless photo.attached?
  end

end
