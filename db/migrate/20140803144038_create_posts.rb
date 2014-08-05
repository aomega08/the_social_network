class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :author_id
      t.text :content
      t.references :postable, polymorphic: true

      t.timestamps
    end
  end
end
