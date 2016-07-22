class Article < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 3 }
  validates :text, length: { minimum: 20 }
end
