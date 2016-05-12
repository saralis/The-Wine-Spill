get '/users/new' do
  erb :'users/new' # Get new user form
end

post '/users' do
  user = User.new(params[:user])
  if user.save #If the user registers successfully
    session[ :user_id ] = user.id #Log user in once they register
    redirect '/questions'
  else
    @errors = user.errors.full_messages #Error messages
    erb :'users/new' #Rerender register screen
  end
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  erb :'users/show' # Show page is also the delete form
end

delete '/users/:id' do
  require_same_user(current_user)
  user = User.find_by(id: params[:id])
  user.destroy
  redirect '/questions'
end
