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
  @votes = @question.votes.sum(:count)

  @question.save
  @user = @question.user
  erb :'questions/show' #show single question view

end

post '/questions/:id/up_votes' do
  @question = Question.find_by( id: params[:id])
  @up_vote = @question.votes.new(count: + 1, user_id: current_user.id)
  if @up_vote.save
    if request.xhr?
      # binding.pry
      @question.votes.sum(:count).to_s
    else
    redirect "/questions/#{@question.id}"
    end
  else
    erb :'/question/show'
  end
end

post '/questions/:id/down_votes' do
  @question = Question.find_by( id: params[:id])
  @down_vote = @question.votes.new(count: -1, user_id: current_user.id)
  if @down_vote.save
    redirect "/questions/#{@question.id}"
  else
    erb :'/question/show'
  end
end

get '/questions/:id/edit' do
  require_same_user(current_user)
  @question = Question.find(params[:id]) #define intstance variable for view
  erb :'questions/edit' #show edit question view

end

post '/answers/:id/up_votes' do
  @answer = Answer.find_by( id: params[:id])
  @up_vote = @answer.votes.new(count: + 1, user_id: current_user.id)
  if @up_vote.save
    redirect "/questions/#{@answer.question.id}"
  else
    erb :'/question/show'
  end
end

post '/answers/:id/down_votes' do
  # binding.pry
  @question = Question.find_by( id: params[:id])
  @answer = Answer.find_by( id: params[:id])
  @down_vote = @answer.votes.new(count: - 1, user_id: current_user.id)
  if @down_vote.save
    redirect "/questions/#{@answer.question.id}"
  else
    erb :'/question/show'
  end
end


post '/comments/:id/up_votes' do
  @comment = Comment.find_by( id: params[:id])
  @up_vote = @comment.votes.new(count: + 1, user_id: current_user.id)
  if @up_vote.save
    redirect "/questions/#{@comment.question.id}"
  else
    erb :'/question/show'
  end
end

post '/comments/:id/down_votes' do
  # binding.pry
  @question = Question.find_by( id: params[:id])
  @comment = Comment.find_by( id: params[:id])
  @down_vote = @comment.votes.new(count: - 1, user_id: current_user.id)
  if @down_vote.save
    redirect "/questions/#{@comment.question.id}"
  else
    erb :'/question/show'
  end
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
  @question.tags.each{|tag| tag.destroy if tag.questions.length <= 1}
  @question.question_tags{|question_tag| question_tag.destroy}
  @question.votes.each{|vote| vote.destroy}
  @question.answers.each do |answer|
    answer.comments.each{|comment| comment.destroy}
    answer.destroy
  end
  @question.comments.each{|comment| comment.destroy}
  @question.destroy #delete question
  redirect '/questions' #redirect back to questions index page
end
