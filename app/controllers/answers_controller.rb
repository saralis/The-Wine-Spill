post '/questions/:question_id/answers' do
  @question = Question.find(params[:question_id])
  @answer = @question.answers.new(params[:answer])

  if @answer.save
    redirect "/questions/#{@question.id}/answers"
  else
    erb :'/questions'
  end
end

put '/questions/:question_id/answers/:answers_id'
  @question = Question.find(params[:question_id])
  @answer = @question.answers.find(params[:id])

  if @answer.update_attributes(params[:answer])
    redirect "/questions/#{question.id}/answers"
  else
    erb :'/questions/:question_id/answers/:answers_id'
end

delete '/questions/:question_id/answers/:answers_id'
  @question = Question.find(params[:question_id])
  @answer = @question.answers.find(params[:id])

  @answer.destroy
  redirect "/questions/#{questions.id}/answers"
end