class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :condition
  has_and_belongs_to_many :categories
  has_one_attached :picture


 #default book image if not attached
 def picture_attachment_path
  picture.attached? ? picture : "book.png"
  end

  
end
