class Question < ActiveRecord::Base


  validates :title, presence: {message: "must be there"}, uniqueness: true

  validates_presence_of :description, message: "must be present"

  default_scope { order("title ASC") }

  # has_many :favorites, dependent: :destroy
  # has_many :favorited_users, through: :favorites, source: :user

  # belongs_to :user

  # has_many :votes, dependent: :destroy
  # has_many :voted_users, through: :votes, source: :user

  # has_many :categorizations, dependent: :destroy
  # has_many :categories, through: :categorizations

  # has_one  :question_detail
  # # question.build_question_detail(notes: "asdf")
  # # question.create_question_detail(notes: "Asdf")

  # has_many :answers, dependent: :destroy
  # # question.answers.build(notes: "asdf")
  # # question.answers.create(notes: "asdf")

  # has_many :comments, through: :answers

  # scope :recent, lambda {|x| order("created_at DESC").limit(x) }
  # # def self.recent(x)
  # #   order("created_at DESC").limit(x)
  # # end

  scope :recent_ten, lambda { order("created_at DESC").limit(10) }
  # def self.recent_ten
  #   order("created_at DESC").limit(10)
  # end

  scope :after, lambda {|date| where(["created_at > ?", date]) }
  #same as below 
  # def self.after(date)
  #   where("updated_at > ?", date)
  # end


  before_save :capitalize_title

  private

  def capitalize_title
    self.title.capitalize!
  end

# validates :title, presence: {message: "must be enterd"}, 
# 								uniqueness: true, 
# 								length: {minimum: 3}


# # old sintax = stiil work but deprecated
# # validates_presence_of :title message: "must be entered"
# validates :description, presence: true

# validates :title_must_be_different

# before_save :capitalize_title

# # #validates :email, format; /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  # scope :recent_ten, -> { limit(10).order("created_at DESC") }
# # scope is same as self method
# def self.recent_ten
# 	limit(10).order("created_at DESC")
# end


# private

# def capitalize_title
# 	self.title.capitalise!
# end

# def title_must_be_different
# 	if title == description
# 		errors.add(:title, "must be different than the description")
# 		# to attach to the object
# 	end
# end


#validates :title, length: { minimum: 2 ,message: "%{length} characters is the minimum allowed"}

end
