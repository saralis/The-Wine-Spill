get '/questions' do
  @questions = Question.all #define instance variable for view
  erb :'questions/index' #show all questions view (index)
end

get '/questions/new' do
  erb :'questions/new' #show new questions view
end

post '/questions' do
  params[:question][:view_count] = 0
  params[:question][:user_id] = current_user.id

  @question = Question.new(params[:question]) #create new question
  if @question.save #saves new question or returns false if unsuccessful
    redirect '/questions' #redirect back to questions index page
  else
    erb :'questions/new' # show new questions view again(potentially displaying errors)
  end
end


get '/questions/:id' do
  @question = Question.find(params[:id]) #define instance variable for view
  @question.view_count += 1 #Increment view count
  @question.save
  @votes = @question.votes.count
  @up_vote = @votes += 1
  @down_vote = @votes -= 1
  @user = @question.user
  erb :'questions/show' #show single question view

end


get '/questions/:id/edit' do
  require_same_user(current_user)
  @question = Question.find(params[:id]) #define intstance variable for view
  erb :'questions/edit' #show edit question view

end


put '/questions/:id' do
  @question = Question.find(params[:id]) #define variable to edit
  @question.assign_attributes(params[:question]) #assign new attributes
  if @question.save #saves new question or returns false if unsuccessful
    redirect '/questions' #redirect back to questions index page
  else
    erb :'questions/edit' #show edit question view again(potentially displaying errors)
  end

end


delete '/questions/:id' do
  @question = Question.find(params[:id]) #define question to delete
  @question.destroy #delete question
  redirect '/questions' #redirect back to questions index page
end
