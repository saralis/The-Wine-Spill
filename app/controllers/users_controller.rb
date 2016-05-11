get '/users/new' do
  erb :'user/new'
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    session[ :user_id ] = user.id #Log user in once they register
    redirect '/questions'
  else
    @errors = user.errors.full_messages #Error messages
    erb :'users/new' #Rerender register screen
  end
end
