class NoticesController < ApplicationController
  before_action :authenticated?
  def index
     @notices = Notice.live.order("start_at DESC").limit(5)
  end
end