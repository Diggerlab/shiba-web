class CreateUploads< ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.references :feedback
      t.string :avatar_file_name
      t.string :avatar_content_type
      t.integer :avatar_file_size
      t.datetime :avatar_updated_at
      t.timestamps
    end
    add_index :uploads, :feedback_id
  end

end