class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy

  belongs_to :user

  attr_accessible :content, :title, :tag_list

  acts_as_taggable

  validates :title,   :presence => true,
                      :uniqueness => { :message => "already taken" },
                      :length => { :within => 2..255 }
                      #:length => { :maximum => 100 }

  validates :content, :presence => true

  self.per_page = 5

  default_scope :order => 'posts.created_at DESC'

end
