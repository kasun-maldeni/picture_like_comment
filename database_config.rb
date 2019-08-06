require 'active_record'

ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'testing')

# Log out SQL queries
ActiveRecord::Base.logger = Logger.new(STDOUT)

class User < ActiveRecord::Base
  has_secure_password

  has_many :pictures, foreign_key: :owner_id
  has_many :comments
  has_many :likes
end

class Picture < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :comments
  has_many :likes, as: :up_vote
end

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :picture
  has_many :likes, as: :up_vote
end

class Like < ActiveRecord::Base
  belongs_to :up_vote, polymorphic: true
  belongs_to :user
end
