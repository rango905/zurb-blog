class Article < ActiveRecord::Base
  has_many :article_keyword_tagships, dependent: :destroy
  has_many :keyword_tags, :through => :article_keyword_tagships

  validates :title, presence: true, length: { minimum: 3 }
  validates :text, length: { minimum: 20 }
end
