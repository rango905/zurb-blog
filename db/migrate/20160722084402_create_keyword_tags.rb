class CreateKeywordTags < ActiveRecord::Migration
  def change
    create_table :keyword_tags do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
