class NoticesController < ApplicationController
  before_action :authenticated?
  def index
    if current_user.read_time.nil?
      @notices = Notice.where("closed_at > ?", Time.now).order("published_at DESC").limit(4)
    else
      @notices = Notice.show_notice(current_user).order("published_at DESC").limit(4)
    end
  end

  def close
    current_user.update(read_time: Time.now)
  end


end