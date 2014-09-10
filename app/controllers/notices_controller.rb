class NoticesController < ApplicationController
  def index
    @notices = Notice.where("closed_at > ?", Time.now).order("published_at DESC").limit(4)
  end

  def close
    
  end


end