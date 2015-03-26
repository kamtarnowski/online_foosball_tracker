class Player < ActiveRecord::Base
  has_many :match_results
  has_attached_file :avatar, styles: {
      thumb: '100x100>',
      square: '200x200#',
      medium: '300x300>',
      large: '500x500'
  }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment_presence :avatar
  validates :last_name, presence: true
  validates :first_name, presence: true
end
