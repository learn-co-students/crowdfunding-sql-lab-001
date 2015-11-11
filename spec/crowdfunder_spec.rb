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

    it "creates a project table with an id as a primary key" do
      expect(@db.execute("PRAGMA table_info(projects);").detect { |arr| arr[-1] == 1 && arr[2] == "INTEGER" }.length).to eq(6)
    end

    it "creates a project table with a title field" do
      expect{@db.execute("SELECT title FROM projects;")}.to_not raise_exception
    end

    it "creates a project table with a category field" do
      expect{@db.execute("SELECT category FROM projects;")}.to_not raise_exception
    end

    it "creates a project table with a funding_goal field" do
      expect{@db.execute("SELECT funding_goal FROM projects;")}.to_not raise_exception
    end

    it "creates a project table with a start_date field" do
      expect{@db.execute("SELECT start_date FROM projects;")}.to_not raise_exception
    end

    it "creates a project table with a end_date field" do
      expect{@db.execute("SELECT end_date FROM projects;")}.to_not raise_exception
    end

    it "creates a user table with an id as a primary key" do
      expect(@db.execute("PRAGMA table_info(users);").detect { |arr| arr[-1] == 1 && arr[2] == "INTEGER" }.length).to eq(6)
    end

    it "creates a user table with a name field" do
      expect{@db.execute("SELECT name FROM users;")}.to_not raise_exception
    end

    it "creates a user table with an age field" do
      expect{@db.execute("SELECT age FROM users;")}.to_not raise_exception
    end

    it "creates a pledge table with an id as a primary key" do
      expect(@db.execute("PRAGMA table_info(pledges);").detect { |arr| arr[-1] == 1 && arr[2] == "INTEGER" }.length).to eq(6)
    end

    it "creates a pledge table with an amount field" do
      expect{@db.execute("SELECT amount FROM pledges;")}.to_not raise_exception
    end

    it "creates a pledge table with a user_id field" do
      expect{@db.execute("SELECT user_id FROM pledges;")}.to_not raise_exception
    end

    it "creates a pledge table with a project_id field" do
      expect{@db.execute("SELECT project_id FROM pledges;")}.to_not raise_exception
    end

  end

  describe "insert.sql" do
    before do
      @sql_runner.execute_create_sql
      @sql_runner.execute_insert_sql
    end

    it "has 20 users" do
      expect(@db.execute("SELECT COUNT(*) FROM users;").flatten[0]).to eq(20)
    end

    it "has 10 projects" do
      expect(@db.execute("SELECT COUNT(*) FROM projects;").flatten[0]).to eq(10)
    end

    it "has 30 pledges" do
      expect(@db.execute("SELECT COUNT(*) FROM pledges;").flatten[0]).to eq(30)
    end

  end

  describe "questions" do
    before do
      @sql_runner.execute_create_sql
      @sql_runner.execute_data
    end
    after do
      File.read('lib/data.sql')
    end

    it '#selects_the_titles_of_all_projects_and_their_pledge_amounts' do
      expect(@db.execute(selects_the_titles_of_all_projects_and_their_pledge_amounts)).to eq([["Animal shelter needs dog food", 210], ["Help me buy a guitar", 98], ["Help save birds of paradise", 170], ["I have bed bugs!", 740], ["I want to teach English in China", 200], ["Iguana needs tail operation", 1035.5], ["My book on SQL", 20], ["The next Harry Potter", 120], ["The next Inna-Gadda-Davida", 342], ["Voldement needs a body", 489]])
    end

    it '#selects_the_user_name_age_and_pledge_amount_for_all_pledges' do
      expect(@db.execute(selects_the_user_name_age_and_pledge_amount_for_all_pledges)).to eq([["Albus", 113, 470], ["Alex", 33, 20], ["Amanda", 24, 40], ["Bear", 6, 50], ["Ena", 24, 100], ["Finnebar", 17, 70], ["Franz", 100, 90], ["Hermione", 30, 50], ["Iguana", 4, 10], ["Katie", 24, 170], ["Marisa", 24, 24], ["Pacha", 5, 60], ["Rosey", 9, 50], ["Sirius", 36, 19], ["Sophie", 24, 60], ["Squid", 5, 270], ["Swizzle", 4, 12], ["Victoria", 23, 1700], ["Voldemort", 90, 34], ["Whale", 6, 125.5]])
    end

    it '#selects_the_titles_of_all_projects_that_have_met_their_funding_goal' do
      expect(@db.execute(selects_the_titles_of_all_projects_that_have_met_their_funding_goal)).to eq([["My book on SQL", 0], ["The next Inna-Gadda-Davida", -142]])
    end

    it '#selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_amount' do
      expect(@db.execute(selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_amount)).to eq([["Iguana", 10], ["Swizzle", 12], ["Sirius", 19], ["Alex", 20], ["Marisa", 24], ["Voldemort", 34], ["Amanda", 40], ["Bear", 50], ["Hermione", 50], ["Rosey", 50], ["Pacha", 60], ["Sophie", 60], ["Finnebar", 70], ["Franz", 90], ["Ena", 100], ["Whale", 125.5], ["Katie", 170], ["Squid", 270], ["Albus", 470], ["Victoria", 1700]])
    end

    it '#selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category' do
      expect(@db.execute(selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category)).to eq([["music", 40], ["music", 24], ["music", 34], ["music", 12], ["music", 40], ["music", 40], ["music", 20], ["music", 230]])
    end

    it '#selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_book_category' do
      expect(@db.execute(selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_book_category)).to eq([["books", 140]])
    end
  end
end
