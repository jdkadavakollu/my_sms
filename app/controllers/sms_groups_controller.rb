class SmsGroupsController < ApplicationController
  def index
  end

  def new
  	@sms_group = SmsGroup.new
  end

  def create
  end

  def send_sms
  	binding.pry
  end
end
