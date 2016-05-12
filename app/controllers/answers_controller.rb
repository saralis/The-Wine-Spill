post '/questions/:question_id/answers' do
  @question = Question.find_by(id: params[:question_id])
  params[:answer][:user_id] = current_user.id
  @answer = @question.answers.new(params[:answer])

  if @answer.save
    redirect "/questions/#{@question.id}"
  else
    erb :'/questions'
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
  @answer.destroy
  redirect "/questions/#{questions.id}"
end
