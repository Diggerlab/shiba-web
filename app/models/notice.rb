class Notice < ActiveRecord::Base
  belongs_to :admin_user
  scope :live, where(enabled: true)
end
