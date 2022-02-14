require "singleton"
require "sqlite3"


class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super("questions.db")
    self.type_translation = true
    self.results_as_hash = true
  end
end

class User
  attr_accessor :id, :fname, :lname

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM users")
    data.map{|datum| User.new(datum)}
  end

  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT 
      *
    FROM 
      users
    WHERE 
      id = ?
      ;
    SQL
    return nil unless user.length > 0
    User.new(user.first)
  end

  def self.find_by_name(fname, lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
    SELECT
      *
    FROM
      users
    WHERE
      fname = ? 
      AND lname = ?;
    SQL
    return nil unless user.length > 0
    User.new(user.first)
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def insert
    raise "#{self} already in database" if self.id
    QuestionsDatabase.instance.execute(<<-SQL, self.fname, self.lname)
      INSERT INTO
        users (fname, lname)
      VALUES
        (?, ?);
      SQL
    self.id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    QuestionsDatabase.instance.execute(<<-SQL, self.fname, self.lname, self.id)
      UPDATE 
        users 
      SET
      fname = ?, lname = ?
      WHERE
        id  = ?
      SQL
  end

  def authored_questions
    Question.find_by_author_id(self.id)
  end

  def authored_replies
    Reply.find_by_user_id(self.id)
  end

end
  

class Question

  attr_accessor :id, :title, :body, :author_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map{|datum| Question.new(datum)}
  end

  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT 
      *
    FROM 
      questions
    WHERE 
      id = ?
      ;
    SQL
    return nil unless question.length > 0
    Question.new(question.first)
  end

  def self.find_by_author_id(author_id)
    question = QuestionsDatabase.instance.execute(<<-SQL, author_id)
    SELECT 
      *
    FROM 
      questions
    WHERE 
      author_id = ?
      ;
    SQL
    question.map { |q| Question.new(q) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def replies 
    Reply.find_by_question_id(self.id)
  end

  def author
    author = QuestionsDatabase.instance.execute(<<-SQL, author_id)
    SELECT
      *
    FROM
      users
    WHERE
      id = ?;
    SQL
    User.new(author.first)
  end
  
end

class QuestionFollow 
  attr_accessor :user_id, :question_id, :id
  def self.find_by_id(id)
    placeholder = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT 
      *
    FROM 
      question_follows
    WHERE 
      id = ?
      ;
    SQL
    return nil unless placeholder.length > 0
    QuestionFollow.new(placeholder.first)
  end

  def self.find_by_user_id(user_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, user_id)
    SELECT 
      *
    FROM 
      question_follows
    WHERE 
      user_id = ?;
    SQL
    return nil unless reply.length > 0
    QuestionFollow.new(reply.first)
    # users  <-> folower <-> question
  end

  def self.followers_for_question_id(question_id)
    
    users = QuestionsDatabase.instance.execute (<<-SQL, question_id)
    SELECT
      *
    FROM
      user
    JOIN 
      question_follows ON users.id = question_follows.user_id
    JOIN
      questions ON question_follows.question_id = questions.id 

    

  SQL
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end

class Reply 
  attr_accessor :id, :subject_id, :parent_id, :rep_author_id, :body, :child_replies
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
    data.map{|datum| Reply.new(datum)}
  end

  def self.find_by_id(id)
    placeholder = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT 
      *
    FROM 
      replies
    WHERE 
      id = ?
      ;
    SQL
    return nil unless placeholder.length > 0
    Reply.new(placeholder.first)
  end

  def self.find_by_user_id(rep_author_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, rep_author_id)
    SELECT 
      *
    FROM 
      replies
    WHERE 
      rep_author_id = ?;
    SQL
    return nil unless reply.length > 0
    reply.map{|each| Reply.new(each)}
  end

  def self.find_by_question_id(subject_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, subject_id)
    SELECT 
      *
    FROM 
      replies
    WHERE 
      subject_id = ?;
    SQL
    return nil unless reply.length > 0
    reply.map{|each| Reply.new(each)}
  end

  def initialize(options)
    @id = options['id']
    @subject_id = options['subject_id']
    @parent_id = options['parent_id']
    @rep_author_id = options['rep_author_id']
    @child_replies = options['child_replies']
    @body = options['body']
  end

  def author
    author = QuestionsDatabase.instance.execute(<<-SQL, rep_author_id)
    SELECT
      *
    FROM
      users
    WHERE
      id = ?;
    SQL
    User.new(author.first)
  end

  def question
    question = QuestionsDatabase.instance.execute(<<-SQL, subject_id)
    SELECT
      *
    FROM
      questions
    WHERE
      id = ?;
    SQL
    Question.new(question.first)
  end

  def parent_reply
    reply = QuestionsDatabase.instance.execute(<<-SQL, parent_id)
    SELECT
      *
    FROM
      replies
    WHERE
      id = ?;
    SQL
    return nil unless reply.length > 0
    Reply.new(reply.first)
  end

  def child_reply
    return nil if child_replies == nil
    reply = QuestionsDatabase.instance.execute(<<-SQL, child_replies)
    SELECT
      *
    FROM
      replies
    WHERE
      id = ?;
    SQL
    return nil unless reply.length > 0
    Reply.new(reply.first)
  end

end

class QuestionLike
  attr_accessor :id, :user_id, :question_id
  def self.find_by_id(id)
    placeholder = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT 
      *
    FROM 
      question_likes
    WHERE 
      id = ?
      ;
    SQL
    return nil unless placeholder.length > 0
    QuestionLike.new(placeholder.first)
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end

# def self.find_by_user_id(subject_id)
#   reply = QuestionsDatabase.instance.execute(<<-SQL, subject_id)
#   SELECT 
#     *
#   FROM 
#     replies
#   WHERE 
#     subject_id = ?;
#   SQL
#   return nil unless reply.length > 0
#   Reply.new(reply.first)
# end