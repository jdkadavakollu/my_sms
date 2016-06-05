class Student < ActiveRecord::Base
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :fname, presence: true
  validates :mobile, presence: true
  validates :dob, presence: true
  
end
