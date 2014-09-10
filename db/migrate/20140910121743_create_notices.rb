class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.references :admin_user
      t.text :content
      t.string :title

      t.datetime :published_at
      t.datetime :closed_at
      t.timestamps
    end
    add_index :notices, :admin_user_id
  end
end
