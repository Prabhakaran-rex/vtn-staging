class CleanUpRefineryTables < ActiveRecord::Migration
  def up
    drop_table(:refinery_images) if table_exists? :refinery_images
    drop_table(:refinery_page_parts) if table_exists? :refinery_page_parts
    drop_table(:refinery_pages) if table_exists? :refinery_pages
    drop_table(:seo_meta) if table_exists? :seo_meta
    drop_table(:refinery_resources) if table_exists? :refinery_resources
    drop_table(:user_plugins) if table_exists? :user_plugins
    drop_table(:refinery_blog_categories) if table_exists? :refinery_blog_categories
    drop_table(:refinery_blog_categories_blog_posts) if table_exists? :refinery_blog_categories_blog_posts
    drop_table(:refinery_blog_comments) if table_exists? :refinery_blog_comments
    drop_table(:refinery_blog_posts) if table_exists? :refinery_blog_posts
    drop_table(:refinery_page_part_translations) if table_exists? :refinery_page_part_translations
    drop_table(:refinery_page_translations) if table_exists? :refinery_page_translations
    drop_table(:refinery_settings) if table_exists? :refinery_settings
    drop_table(:taggings) if table_exists? :taggings
    drop_table(:tags) if table_exists? :tags
  end

  def down
  end

end
