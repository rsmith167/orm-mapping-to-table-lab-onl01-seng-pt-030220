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
CREATE TABLE IF NOT EXIST  songs(
id INTERGER PRIMARY KEY,
name TEXT,
grade INTERGER
)
SQL
DB[:conn].execute(sql)
end

def self.drop_table
sql = <<-SQL
DROP TABLE songs
SQL
DB[:conn].execute(sql)
end

def save
  
end

def self.create_save
  
end


end
