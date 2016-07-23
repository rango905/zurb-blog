class CreateArticleKeywordTagships < ActiveRecord::Migration
  def change
    create_table :article_keyword_tagships do |t|
      t.integer :article_id
      t.integer :keyword_tag_id

      t.timestamps null: false
    end
  end
end
