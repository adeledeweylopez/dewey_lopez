module CommentsHelper

  def remember_comment(comment)
  	token = Comment.new_token
  	cookies["token-#{comment.id}"] = { value: token, 
  						expires: 2.days.from_now.utc }
  	comment.update_attribute(:token, Comment.digest(token))
  end
  
  def owns_comment?(comment)
  	token = Comment.digest(cookies["token-#{comment.id}"])
  	comment.token == token
  end

  def forget_comment(comment)
  	cookies.delete("token-#{comment.id}")
  end
end