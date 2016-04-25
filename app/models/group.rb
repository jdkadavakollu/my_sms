class Group < ActiveRecord::Base
  belongs_to :user
  has_many :contacts, dependent: :destroy
  validates :name, presence: true, uniqueness: {scope: :user_id}, length: { maximum: 100 }
end
