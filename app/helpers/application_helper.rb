# frozen_string_literal: true

module ApplicationHelper
  def login_helper(style = '')
    if user_signed_in?
      (link_to 'Edit Perfil', edit_user_registration_path, class: style) + ' '.html_safe +
        (link_to 'Logout', destroy_user_session_path, method: :delete, class: style)
    else
      (link_to 'Register', new_user_registration_path, class: style) +
        ' '.html_safe +
        (link_to 'Login', new_user_session_path, class: style)
    end
  end

  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: proposers_path,
        title: 'Proponentes'
      }
    ]
  end

  def nav_helper(style, tag_type)
    nav_links = ''.dup

    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}" \
                   "</a></#{tag_type}>"
    end
    nav_links.html_safe
  end

  def active?(path)
    'active' if current_page? path
  end

  def alerts
    flash.each_with_object([]) do |(type, message), flash_messages|
      flash_messages << toastr_flash(type, message).html_safe if message
    end.join("\n").html_safe
  end

  def toastr_flash(type, message)
    type = 'success' if type == 'notice'
    type = 'error' if type == 'alert'
    "<script>toastr.#{type}('#{message}');</script>"
  end
end
