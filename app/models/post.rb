require 'pry'
class MyValidator < ActiveModel::Validator
  def validate(post)
    if post.title != nil
      unless post.title.include?('Won\'t')

        post.errors[:title] << 'Invalid!'
      end
    else
      post.errors[:title] << 'Missing title'
    end
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with MyValidator

  validates :title, presence: true
  validates :content, length: {minimum: 10, too_short: "Abstract."}
  validates :summary, length: {maximum: 50}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

end
