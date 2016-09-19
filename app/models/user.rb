class User < ActiveRecord::Base
  # basic devise configuration
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # updates access token
  after_create :update_access_token!

  # validates for presence of email
  validates :email, presence: true

  private
  # access token restocking
  def update_access_token!
    self.access_token = generate_access_token
    save
  end

  # generation of new access token
  def generate_access_token
    loop do
      token = "#{self.id}:#{Devise.friendly_token}"
      break token unless User.where(access_token: token).first
    end
  end

  # picture uploading settings
  mount_base64_uploader :picture, PictureUploader
end