module PostsHelper
  def main_message
    if user_signed_in?
      content_tag :div do
        content_tag :h2 do
          "Hello #{current_user.name}"
        end
      end
    else
      content_tag :div do
        content_tag :h2, 'Hello Stranger'
      end
    end
  end

  def user_post(post)
    if user_signed_in? && current_user.id == post.user_id
      content_tag :div, class: 'mt-2' do
        content_tag :ul, class: 'list-group' do
          (content_tag :li, post.user.name, class: 'list-group-item active') +
            (content_tag :li, post.title, class: 'list-group-item') +
            (content_tag :li, post.body, class: 'list-group-item')
        end
      end
    else
      content_tag :div, class: 'mt-2' do
        content_tag :ul, class: 'list-group' do
          (content_tag :li, post.title, class: 'list-group-item') +
            (content_tag :li, post.body, class: 'list-group-item')
        end
      end
    end
  end

  def user_session
    if user_signed_in?
      content_tag :div, class: 'text-center py-3' do
        (button_to 'sign out', destroy_user_session_path, method: :delete, class: 'btn btn-primary w-100 mb-3') +
          (link_to 'new post', new_post_path, class: 'btn btn-primary btn-dark w-100 ') #Ask TSE why with button the link doesnt work
      end
    else
      content_tag :div, class: 'text-center py-3' do
        (button_to 'sign in', new_user_session_path, class: 'btn btn-primary w-100 mb-3') +
          (link_to 'sign up', new_user_registration_path, class: 'btn btn-dark w-100 mb-3')
      end
    end
  end
end