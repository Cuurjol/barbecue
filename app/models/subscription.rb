class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :event, presence: true
  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, format: /\A[^@\s]+@(?:[-a-z0-9]+\.)+[a-z]{2,}\z/i, unless: -> { user.present? }
  validates :user, uniqueness: { scope: :event_id }, if: -> { user.present? }
  validates :user_email, uniqueness: { scope: :event_id }, unless: -> { user.present? }

  validate :email_belongs_user?, on: :create

  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  private

  def email_belongs_user?
    if User.all.map(&:email).include?(user_email)
      errors.add(:email, I18n.t('activerecord.errors.models.subscription.email_belongs_user'))
    end
  end
end
