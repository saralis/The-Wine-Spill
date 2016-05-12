#users
User.create(username: 'test', email: 'test@test.com', password: 'test')

#Question
Question.create(title: 'question1', body: 'question1', view_count: 0, user_id: 1)

#Answer
Answer.create(body: 'Answer1', user_id: 1, question_id: 1)

#comments
Comment.create(body: 'comment1', commentable_id: 1, commentable_type: 'Answer', user_id: 1)

#votes
Vote.create(count: 1, user_id: 1, votable_id: 1, votable_type: 'Question')








