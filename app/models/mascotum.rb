class Mascotum < ActiveRecord::Base

  has_attached_file :image, styles: { small: "150x150>", medium: '300x300>', large: '600x600>' }
  validates_attachment :image,
    :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }
end
