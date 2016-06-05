class Course < ActiveRecord::Base
  belongs_to :user
  has_many :sections

  validates :name, presence: true
end
