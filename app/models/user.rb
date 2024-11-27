class User < ApplicationRecord
  before_create :generate_referral_token

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  include Devise::JWT::RevocationStrategies::Null 

  belongs_to :invited_by, class_name: 'User', optional: true
  has_many :invitees, class_name: 'User', foreign_key: 'invited_by_id'

  private

  def generate_referral_token
    self.referral_token = SecureRandom.hex(10) unless self.referral_token
  end
end
