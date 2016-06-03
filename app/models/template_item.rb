# Template Items
class TemplateItem < ActiveRecord::Base
  has_many :templates

  ITEMS = %W(Ganesh_Chaturthi Christmas Diwali Dussehra Good_Friday Holi Independence_Day
             krishna_Ashtami New_Year Raksha_Bandhan Republic_Day Sivaratri Sri_Rama_Navami ugadi
             Stay_in_Touch Thank_you)
end
