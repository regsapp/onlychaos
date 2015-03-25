module ApplicationHelper
  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end
  
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

  def ckeditor_params
    { :language => 'en', extraPlugins: 'mathjax,imageresize,oembed,tableresize' }
  end
end
