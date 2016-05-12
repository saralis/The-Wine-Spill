get '/login' do
  erb :'sessions/new' # Render login form
end

post '/login' do
  user = User.find_by(email: params[:email]) #Find the user by the email in the form
  if user && user.authenticate(params[:password]) #If user is found, and password validates
    session[:user_id] = user.id #Assign the user a session
    redirect '/questions' #Redirect to the home page
  else
# <<<<<<< Updated upstream
#     @errors = user.errors.full_messages #Otherwise display errors
# =======
#     # binding.pry
#     # @errors = user.errors.full_messages #Otherwise display errors
# >>>>>>> Stashed changes
    erb :'sessions/new' # And rerender the login form
  end
end

get '/logout' do
  session.clear #Delete the session logging out the user
  redirect '/questions'
end
