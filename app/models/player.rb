class Player < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :position
  has_many :reviews
  
  
  
    has_attached_file :photo, styles: { index: "232x309>", show: "450x450>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  
  
  
  private
  
  def self.ratting(play)
    
    play.each do | p |
     
      p.reviews.all
    end 
  end  
  
  
  
end
