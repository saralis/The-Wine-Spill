def current_user
  @current_user ||= User.find_by(id: sessions[:user_id]) #Assigns the instance variable to the the user whose id matches the session id
end

def logged_in?
  !!current_user #If there is a current user then logged_in? is true
end

def require_user
  redirect '/questions' unless logged_in? #Require a person to be logged in to do something
end

def required_same_user
  redirect '/' unless logged_in? && params[:id].to_i == session[:user_id] #Require a person to be logged in and the same user who did the action to do something
end
