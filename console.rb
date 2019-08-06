require 'pry'
require_relative 'database_config'

# SELECT up_vote_id AS comment_id, COUNT(*) AS likes
# FROM likes
# WHERE up_vote_type = 'Comment' AND up_vote_id IN (
#   SELECT id FROM comments WHERE picture_id = 4
# )
# GROUP BY up_vote_id
# ORDER BY likes DESC;

likes = Like
        .where(
          up_vote_type: 'Comment',
          up_vote_id: Comment.where(picture_id: 1)
        )
        .group(:up_vote_id)
        .order(Arel.sql('COUNT(*) DESC'))
        .count

binding.pry
