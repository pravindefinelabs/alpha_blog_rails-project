module ApplicationHelper
  def flash_class(type)
    case type.to_sym
    when :notice then "alert-success"  # Green for success messages
    when :alert then "alert-danger"    # Red for error messages
    else "alert-info"                  # Default (Blue)
    end
  end

  def gravatar_for(user, options = { size: 80 })
    email_address = user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]   
    image_src = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(image_src, alt: user.username, class: "rounded shadow mx-auto d-block")
  end
  # def current_user 
  #   @current_user ||= User.find(session[:user_id])if session[:user_id]
  # end

  # def logged_in?
  #   !!current_user
  # end
  

end
