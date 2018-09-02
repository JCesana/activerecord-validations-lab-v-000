class Post < ActiveRecord::Base
  validates :title, presence: true 
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
  validates is_clickbait?
  
  CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
    ] 
    
  def is_clickbait?
     CLICKBAIT_PATTERNS.none? do |pattern|
       if pattern.match :title
         errors.add(:title, "Title must be clickbaity.") 
       end 
     end 
  end 
  
end