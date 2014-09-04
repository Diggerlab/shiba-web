class Notice < ActiveRecord::Base
  belongs_to :admin_user
  private

  def self.show_notice(user)
    where("published_at > ?", user.read_time).where("closed_at > ?", Time.now)
  end
end
