class Student

attr_accessor :name, :grade
attr_reader :id

def initialize(name, grade, id = nil)
@name = name
@grade = grade
@id = id
end

def self.create_table
sql = <<-SQL
CREATE TABLE IF NOT EXIST  students(
id INTERGER PRIMARY KEY,
name TEXT,
grade INTERGER
)
SQL
DB[:conn].execute(sql)
end

def self.drop_table
sql = <<-SQL
DROP TABLE students
SQL
DB[:conn].execute(sql)
end

def save
  sql = <<-SQL
  INSERT INTO students (name,grade) VALUES (? ?)
  SQL
  DB[:conn].execute(sql, self.name, self.grade)
  @id = DB[:conn].execute("SELECT LAST_INSERT_ROWID() FROM students")[0][0]
end

def self.create(name, grade)
  student = Students.new(name, grade)
  student.save
  student
end


end
