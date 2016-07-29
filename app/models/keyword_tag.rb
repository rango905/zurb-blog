class KeywordTag < ActiveRecord::Base
  has_many :article_keyword_tagships, dependent: :destroy
  has_many :articles, :through => :article_keyword_tagships
  
  validates :name, length: { minimum: 2 }
end
