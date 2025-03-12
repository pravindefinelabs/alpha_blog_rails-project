module ApplicationHelper
  def flash_class(type)
    case type.to_sym
    when :notice then "alert-success"  # Green for success messages
    when :alert then "alert-danger"    # Red for error messages
    else "alert-info"                  # Default (Blue)
    end
  end
end
