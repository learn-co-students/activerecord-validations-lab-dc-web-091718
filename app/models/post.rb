class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: {minimum: 250}
	validates :summary, length: {maximum: 250}
	validates :category, inclusion: ["Fiction", "Non-Fiction"]
	validate :click_batey?

	def click_batey?
		if !(!title.nil? && title.match(/Won't Believe|Secret|Top \d+|Guess/))
			errors.add(:title, "must be click batey")
		end
	end
end
