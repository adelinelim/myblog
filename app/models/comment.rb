class Comment < ActiveRecord::Base
  belongs_to :post

  attr_accessible :name, :content

  validates :name,  :presence => true,
                    :length => { :within => 2..100 }

  validates :content,  :presence => true

end
