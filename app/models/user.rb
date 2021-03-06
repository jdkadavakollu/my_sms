class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :groups, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :sms_groups, dependent: :destroy
  has_many :courses, dependent: :destroy
  has_many :sections, dependent: :destroy
  has_many :students, dependent: :destroy
  before_create :set_default_role
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true

  #constants
  ROLES = %w( super_admin admin)

  #default role
  def set_default_role
  	self.role ||= Role.find_by_name('admin')
  end
  
  # fullname
  def full_name
    "#{first_name} #{last_name}".titleize
  end
end
