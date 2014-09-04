class Feedback < ActiveRecord::Base
  BUCKET = Rails.application.secrets[:bucket]
  ACCESSKET = Rails.application.secrets[:access_key_id]
  SECRETKEY = Rails.application.secrets[:secret_access_key]
  before_create :randomize_file_name  
  
  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }, :storage => :s3, :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def s3_credentials
    {:bucket => BUCKET, :access_key_id => ACCESSKET, :secret_access_key => SECRETKEY}
  end

  private  
  def randomize_file_name
    return if avatar_file_name == nil
    extension = File.extname(avatar_file_name).downcase  
    self.avatar.instance_write(:file_name, "#{Time.now.strftime("%Y%m%d%H%M%S")}_#{self.user_code}#{extension}")  
  end  
end