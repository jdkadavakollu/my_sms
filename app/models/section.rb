class Section < ActiveRecord::Base
  belongs_to :course

  valdates :name, presence: true
end
