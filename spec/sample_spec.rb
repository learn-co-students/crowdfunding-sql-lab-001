require "spec_helper"

describe "quizzes sql" do
  before do
    @db = SQLite3::Database.new(':memory:')
    @sql_runner = SQLRunner.new(@db)
  end

  describe "schema.sql" do
    before do
      @sql_runner.execute_sample_sql  
    end

    it "creates a users table with a name field" do
      expect{@db.execute("SELECT name FROM users;")}.to_not raise_exception
    end

    it "creates a quizzes table with a name field" do
      expect{@db.execute("SELECT name FROM quizzes;")}.to_not raise_exception
    end

    it "creates a questions table with a quiz_id field" do
      expect{@db.execute("SELECT quiz_id FROM questions;")}.to_not raise_exception
    end

    it "has a options table with a correct field" do
      expect{@db.execute("SELECT correct FROM options;")}.to_not raise_exception
    end

    its "options table correct field is of type integer" do
      expect(@db.execute("PRAGMA table_info(options);").flatten.first).to be_an(Integer)
    end

    it "has an answers table with user_id, question_id and option_id fields" do
      expect{@db.execute("SELECT user_id, question_id, option_id FROM answers;")}.to_not raise_exception
    end
  end  
end






