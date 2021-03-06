class Player < ActiveRecord::Base
  before_create :create_name
  has_many :match_results
  has_attached_file :avatar, styles: {
      thumb: '50x50>',
      square: '200x200#',
      medium: '300x300>',
      large: '500x500'
  }
  extend FriendlyId
  friendly_id :name, use: :slugged
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment_presence :avatar
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :name, uniqueness: true

  def create_name
    self.name="#{last_name} #{first_name}"
  end
end