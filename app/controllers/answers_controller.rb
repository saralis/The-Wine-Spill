post '/questions/:question_id/answers' do
  @question = Question.find_by(question_id: params[:question_id])
  @answer = @question.answers.new(params[:answer])
  if @answer.save
    redirect "/questions/#{@question.id}"
  else
    erb :'/questions'
  end
end

put '/questions/:question_id/answers/:answers_id' do
  same_user
  @question = Question.find_by(question: params[:question_id])
  @answer = @question.answers.find_by(id: params[:id])
  @answer.assign_attributes(params[:answer])
  if @answer.save
    redirect "/questions/#{question.id}"
  else
    erb :'/questions/:question_id'
  end
end

delete '/questions/:question_id/answers/:answers_id' do
  same_user
  @question = Question.find_by(question_id: params[:question_id])
  @answer = @question.answers.find_by(id: params[:id])
  @answer.destroy
  redirect "/questions/#{questions.id}"
end
