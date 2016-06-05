class Course < ActiveRecord::Base
  before_create :default_user
  belongs_to :user
  has_many :sections

  validates :name, presence: true

  def default_user
  	self.user_id = 1
  end
end
