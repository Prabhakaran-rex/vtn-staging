# This migration comes from refinery_blog (originally 20110803223524)
class ActsAsTaggableOnMigration < ActiveRecord::Migration
  def up
    # Since there is an existing tag table we should rename it
    rename_table :tags, :phototags

    create_table :tags do |t|
      t.string :name
    end

    create_table :taggings do |t|
      t.references :tag

      # You should make sure that the column created is
      # long enough to store the required class names.
      t.references :taggable, :polymorphic => true
      t.references :tagger, :polymorphic => true

      t.string :context

      t.datetime :created_at
    end

    add_index :taggings, :tag_id
    add_index :taggings, [:taggable_id, :taggable_type, :context]
  end

  def down
    drop_table :taggings
    drop_table :tags
    rename_table :phototags, :tags
  end
end
