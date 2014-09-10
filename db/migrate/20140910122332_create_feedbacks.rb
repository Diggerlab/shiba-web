class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :uid, limit: 20
      t.string :content, limit: 2000
      t.string :email, :order_number, :order_note 
      t.timestamp :created_at, :order_paid_at, :error_reported_at
    end
    add_index :feedbacks, :uid
  end
end

