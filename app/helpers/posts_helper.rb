module PostsHelper
  def join_tags(post)
    post.tags.map { |t| t.name }.join(", ")
  end

  def is_current_user_post(post)
    user_signed_in? and current_user.id == post.user_id
  end

  def post_user_name(post)
    User.find_by_id(post.user_id).email
  end

  def post_exceeded
    Post.count > Post.per_page
  end

end
