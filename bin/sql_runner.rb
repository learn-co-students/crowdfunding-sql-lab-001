require_relative 'environment'

class SQLRunner
  def initialize(db)
    @db = db
  end

  def execute_create_sql
    sql = File.read('lib/create.sql')
    execute_sql(sql)
  end

  def execute_insert_sql
    sql = File.read('lib/insert.sql')
    execute_sql(sql)
  end

  def execute_sql(sql)
     sql.scan(/[^;]*;/m).each { |line| @db.execute(line) } unless sql.empty?
  end
end