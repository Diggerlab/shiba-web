class NoticesController < ApplicationController
  def index
    @notices = Notice.live.order("start_at DESC").limit(5)
  end

  def close
    
  end


end