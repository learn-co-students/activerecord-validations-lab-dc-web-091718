class Post < ActiveRecord::Base

  CLICKBAIT_TITLES = [
    /Won't believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def is_clickbait?
    if CLICKBAIT_TITLES.none? { |pattern| pattern.match title }
      errors.add(:title, "needs to be clickbait")
    end
  end

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
  validate :is_clickbait?
end
