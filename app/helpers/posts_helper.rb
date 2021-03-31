module PostsHelper
  def if_session; end

  def user_post(_post)
    if user_signed_in?
      content_tag :table do
        content_tag :thead do
          content_tag :tr do
            (content_tag :th, "Name") +
              (content_tag :th, "Title") +
              (content_tag :th, "Body") +
              (content_tag :th, colspan: '3')
          end
        end
      end
      content_tag :tbody do
        content_tag :tr do
          (content_tag :td, _post.user.email) +
          (content_tag :td, _post.title) +
            (content_tag :td, _post.body)
        end
      end
    end
  end
end
