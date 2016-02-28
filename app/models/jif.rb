class Jif < ActiveRecord::Base
  belongs_to :category
  has_many :favorites
  has_many :users, through: :favorites

  validates :jif_path,    presence:   true,
                          uniqueness: true
  validates :static_path, presence:   true,
                          uniqueness: true
  validates :category, presence:   true
  validates :width, presence:   true
  validates :height, presence:   true
end
