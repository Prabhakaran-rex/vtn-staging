class CleanUpRefineryTables < ActiveRecord::Migration
  def up
    drop_table :refinery_images
    drop_table :refinery_page_parts
    drop_table :refinery_pages
    drop_table :seo_meta
    drop_table :refinery_resources
    drop_table :user_plugins
    drop_table :refinery_blog_categories
    drop_table :refinery_blog_categories_blog_posts
    drop_table :refinery_blog_comments
    drop_table :refinery_blog_posts
    drop_table :refinery_page_part_translations
    drop_table :refinery_page_translations
    drop_table :refinery_settings
    drop_table :taggings
    drop_table :tags
  end

  def down
  end

end
