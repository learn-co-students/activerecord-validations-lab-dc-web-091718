class Post < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_clickbait?

  def is_clickbait?
     errors.add(:title) if [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i].none? { |pat| return true if pat.match title }
  end

end
