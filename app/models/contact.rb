class Contact < ActiveRecord::Base
  belongs_to :group
  validates :name, presence: true, length: { maximum: 50 }
  validates :mobile, presence: true, :numericality => true
end
