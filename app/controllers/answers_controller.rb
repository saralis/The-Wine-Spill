post '/questions/:question_id/answers' do
  @question = Question.find_by(id: params[:question_id])
  params[:answer][:user_id] = current_user.id
  @answer = @question.answers.new(params[:answer])
  if @answer.save
    @answer.votes.create(count: 0, user_id: current_user.id)
    redirect "/questions/#{@question.id}"
  else
    erb :'/questions'
  end
end

post '/answers/:id/up_votes' do
  # binding.pry
  @question = Question.find(params[:id]) #define instance variable for view
  @answer = Answer.find_by( id: params[:id])
  @up_vote = @answer.votes.new(count: + 1, user_id: current_user.id)
  if @up_vote.save
    redirect "/questions/#{@question.id}"
  else
    erb :'/question/show'
  end
end

post '/questions/:id/down_votes' do
  @question = Question.find_by( id: params[:id])
  @answer = Answer.find_by( id: params[:id])
  @down_vote = @answer.votes.new(count: - 1, user_id: current_user.id)
  if @down_vote.save
    redirect "/questions/#{@question.id}"
  else
    erb :'/question/show'
  end
end

put '/questions/:question_id/answers/:answers_id' do
  @question = Question.find_by(id: params[:question_id])
  same_user(@question.user)
  @answer = @question.answers.find_by(id: params[:id])
  @answer.assign_attributes(params[:answer])
  if @answer.save
    redirect "/questions/#{question.id}"
  else
    erb :'/questions/edit'
  end
end

delete '/questions/:question_id/answers/:answers_id' do
  @question = Question.find_by(id: params[:question_id])
  same_user(@question.user)
  @answer = @question.answers.find_by(id: params[:id])
  @answer.comments.each{|comment| comment.destroy}
  @answer.destroy
  redirect "/questions/#{questions.id}"
end
