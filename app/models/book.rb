class Book < ActiveRecord::Base
belongs_to :author
validates :title, :author, :price, presence: true
end
