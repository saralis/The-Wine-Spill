#users
User.create(username: 'test', email: 'test@test.com', password: 'test')
User.create(username: 'test2', email: 'test2@test2.com', password: 'test2')
User.create(username: 'test2', email: 'test2@test2.com', password: 'test2')
User.create(username: 'test3', email: 'test3@test3.com', password: 'test3')
User.create(username: 'test4', email: 'test4@test4.com', password: 'test4')
User.create(username: 'test5', email: 'test5@test5.com', password: 'test5')
User.create(username: 'test6', email: 'test6@test6.com', password: 'test6')

#Question
Question.create(title: 'question1', body: 'question1', view_count: 0, user_id: 1)
Question.create(title: 'question2', body: 'question2', view_count: 0, user_id: 1)
Question.create(title: 'question3', body: 'question3', view_count: 0, user_id: 1)
Question.create(title: 'question4', body: 'question4', view_count: 0, user_id: 1)
Question.create(title: 'question5', body: 'question5', view_count: 0, user_id: 1)
Question.create(title: 'question6', body: 'question6', view_count: 0, user_id: 1)

#Answer
Answer.create(body: 'Answer1', user_id: 1, question_id: 1)
Answer.create(body: 'Answer2', user_id: 1, question_id: 1)
Answer.create(body: 'Answer3', user_id: 2, question_id: 2)
Answer.create(body: 'Answer4', user_id: 2, question_id: 2)
Answer.create(body: 'Answer5', user_id: 3, question_id: 3)
Answer.create(body: 'Answer6', user_id: 3, question_id: 3)
Answer.create(body: 'Answer7', user_id: 3, question_id: 3)

#comments
Comment.create(body: 'comment1', commentable_id: 1, commentable_type: 'Answer', user_id: 1)
Comment.create(body: 'comment2', commentable_id: 1, commentable_type: 'Question', user_id: 1)
Comment.create(body: 'comment3', commentable_id: 2, commentable_type: 'Question', user_id: 2)
Comment.create(body: 'comment4', commentable_id: 2, commentable_type: 'Answer', user_id: 2)
Comment.create(body: 'comment5', commentable_id: 3, commentable_type: 'Answer', user_id: 3)
Comment.create(body: 'comment6', commentable_id: 3, commentable_type: 'Answer', user_id: 3)
Comment.create(body: 'comment7', commentable_id: 4, commentable_type: 'Question', user_id: 4)

#votes
Vote.create(count: 1, votable_id: 1, votable_type: 'Question')
Vote.create(count: 2, votable_id: 2, votable_type: 'Answer')
Vote.create(count: 2, votable_id: 2, votable_type: 'Question')
Vote.create(count: 2, votable_id: 2, votable_type: 'Answer')
Vote.create(count: 3, votable_id: 3, votable_type: 'Question')
Vote.create(count: 3, votable_id: 3, votable_type: 'Answer')
Vote.create(count: 3, votable_id: 3, votable_type: 'Question')
Vote.create(count: 4, votable_id: 4, votable_type: 'Answer')







