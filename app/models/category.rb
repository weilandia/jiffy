class Category < ActiveRecord::Base
  has_many :jifs
  validates :category, presence: true, uniqueness: true
end
