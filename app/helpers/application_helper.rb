# Application helpers
module ApplicationHelper
  # Page title
  def title(page_title)
    content_for(:title) { page_title ? '| '+page_title : nil }
  end

  # Current page breadcrumb
  def add_normalized_breadcrumb(page_title)
    add_breadcrumb(truncate(page_title.to_s, length: 25), nil)
  end

  # Adding breadcrumbs and setting page title
  def add_breadcrumb_and_set_title(page_title)
    title page_title
    add_normalized_breadcrumb(page_title)
  end

  def is_active_controller(controller_name)
    params[:controller] == controller_name ? "active" : nil
  end

  def is_active_action(action_name)
    params[:action] == action_name ? "active" : nil
  end
end
