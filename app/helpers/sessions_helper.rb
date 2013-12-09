module SessionsHelper

	  def sign_in(user)
        self.current_user = user
      if params[:remember_me]
    	  cookies.permanent[:remember_token] = user.remember_token
    	
      else
        cookies[:remember_token] = user.remember_token

      end
    end

  	def signed_in?
    	!current_user.nil?
  	end

	  def current_user=(user)
    	@current_user = user
  	end

  	def current_user
      @current_user ||= User.find_by_remember_token(cookies[:remember_token]) if cookies[:remember_token]
    end

    def current_user?(user)
      user == current_user
    end

    def sign_out
      self.current_user = nil
      cookies.delete(:remember_token)
    end

    def redirect_back_or(default)
      redirect_to(session[:return_to] || default)
      session.delete(:return_to)
    end

    def store_location
      session[:return_to] = request.url
    end

    def signed_in_user_filter
    if signed_in?
        redirect_to users_path, notice: "Already logged in"
    end
  end
end