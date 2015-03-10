module ApplicationHelper
  def model_menu_item(model)
    if can? :read, model
      resources = model.to_s.underscore.pluralize
      path = send(resources + '_path')
      class_name = current_page?(path) ? 'active' : nil
      content_tag(:li, class: class_name) do
        link_to resources.humanize, path
      end
    end
  end
end
