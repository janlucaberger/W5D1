class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :user_comments do |t|
      t.string :body, null: false
      t.integer :author_id, null: false
      t.integer :commentee_id, null: false
      t.timestamps
    end

    create_table :goal_comments do |t|
      t.string :body, null: false
      t.integer :author_id, null: false
      t.integer :goal_id, null: false
      t.timestamps
    end
    add_index :user_comments, [:author_id, :commentee_id]
    add_index :goal_comments, [:author_id, :goal_id]
  end
end
