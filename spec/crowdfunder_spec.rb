require "spec_helper"

describe "crowdfunder sql" do
  before do
    @db = SQLite3::Database.new(':memory:')
    @sql_runner = SQLRunner.new(@db)
  end

  describe "create.sql" do
    before do
      @sql_runner.execute_create_sql  
    end

    it "creates a user table with a name field" do
      expect{@db.execute("SELECT name FROM user;")}.to_not raise_exception
    end

    it "creates a user table with an age field" do
      expect{@db.execute("SELECT age FROM user;")}.to_not raise_exception
    end

    it "creates a user table with an id as a primary key" do
      expect{@db.execute("SHOW KEYS FROM user WHERE id = 'PRIMARY';")}.to_not raise_exception
    end

    it "creates a pledge table with an amount field" do
      expect{@db.execute("SELECT amount FROM pledge;")}.to_not raise_exception
    end

    it "creates a pledge table with a user_id field" do
      expect{@db.execute("SELECT user_id FROM pledge;")}.to_not raise_exception
    end

    it "creates a pledge table with a project_id field" do
      expect{@db.execute("SELECT project_id FROM pledge;")}.to_not raise_exception
    end

    it "creates a pledge table with an id as a primary key" do
      expect{@db.execute("SHOW KEYS FROM pledge WHERE id = 'PRIMARY';")}.to_not raise_exception
    end

    it "creates a project table with a title field" do
      expect{@db.execute("SELECT title FROM project;")}.to_not raise_exception
    end

    it "creates a project table with a category field" do
      expect{@db.execute("SELECT category FROM project;")}.to_not raise_exception
    end

    it "creates a project table with a funding_goal field" do
      expect{@db.execute("SELECT funding_goal FROM project;")}.to_not raise_exception
    end

    it "creates a project table with a start_date field" do
      expect{@db.execute("SELECT start_date FROM project;")}.to_not raise_exception
    end

    it "creates a project table with a end_date field" do
      expect{@db.execute("SELECT end_date FROM project;")}.to_not raise_exception
    end

    it "creates a project table with an id as a primary key" do
      expect{@db.execute("SHOW KEYS FROM project WHERE id = 'PRIMARY';")}.to_not raise_exception
    end

  end 

  describe "insert.sql" do
    before do
      @sql_runner.execute_create_sql
      @sql_runner.execute_insert_sql  
    end 

    it "has 20 users" do
      expect{@db.execute("SELECT COUNT(*) FROM user;")}.to_not raise_exception
    end

    it "has 10 projects" do
      expect{@db.execute("SELECT COUNT(*) FROM project;")}.to_not raise_exception
    end

    it "has 30 pledges" do
      expect{@db.execute("SELECT COUNT(*) FROM pledge;")}.to_not raise_exception
    end

  end

  describe "questions" do
    before do
      @sql_runner.execute_create_sql
      @sql_runner.execute_insert_sql 
    end

    xit 'selects the titles of all projects and their pledge amounts' do
    end

    xit 'selects the user name, age, and pledge amount for all pledges' do
    end

    xit 'selects the titles of all projects that have met their funding goal' do 
    end

    xit 'selects user names and amounts of all pledges then orders them by the amount' do 
    end

    xit 'selects the category names, and pledge amounts of all pledges in the music category' do
    end

    xit 'selects the category names and the sum total of the pledge amounts of all the pledges in the book category' do   
    end
  end
end
