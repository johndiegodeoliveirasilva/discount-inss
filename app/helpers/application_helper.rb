# frozen_string_literal: true

module ApplicationHelper
  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: root_path,
        title: 'Cadastro de Proponentes'
      },
      {
        url: root_path,
        title: 'Relatorios'
      }
    ]
  end

  def nav_helper(style, tag_type)
    nav_links = ''.dup

    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}
                    </a></#{tag_type}>"
    end
    nav_links.html_safe
  end

  def active?(path)
    'active' if current_page? path
  end
end
