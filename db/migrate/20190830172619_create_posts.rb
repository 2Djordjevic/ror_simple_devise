class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Post.create_translation_table! :title => :string, :text => :text
      end

      dir.down do
        Post.drop_translation_table!
      end
    end
  end
end
