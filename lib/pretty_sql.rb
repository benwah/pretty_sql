require 'anbt-sql-formatter/formatter'


module PrettySql
  PYGMENTIZE_EXEC_NAME = 'pygmentize'

  def self.prettify_sql(sql)
    self.pygmentize_sql(self.tidy_sql(sql))
  end

  def self.pygmentize_sql(sql)
    # Colorize SQL by piping to pygmentize if it exists.
    
    pygmentize_path = self.get_pygmentize_executable

    return sql unless pygmentize_path

    IO.popen("#{pygmentize_path} -l sql", 'r+') do |process|
      process.write(sql)
      process.close_write
      process.read
    end
  end

  def self.tidy_sql(sql)
    # Auto-indent SQL

    rule = AnbtSql::Rule.new
    rule.keyword = AnbtSql::Rule::KEYWORD_UPPER_CASE
    %w(count sum substr date).each do |func_name|
      rule.function_names << func_name.upcase
    end
    rule.indent_string = "    "
    formatter = AnbtSql::Formatter.new(rule)
    formatter.format(sql)
  end

private

  def self.get_pygmentize_executable
    # Find executable for pygmentize
    
    return ENV['PYGMENTIZE_PATH'] if ENV['PYGMENTIZE_PATH'] 
      
    exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
    ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
      exts.each { |ext|
        exe = File.join(path, "#{PYGMENTIZE_EXEC_NAME}#{ext}")
        return exe if File.executable?(exe) && !File.directory?(exe)
      }
    end

    return nil
  end
end
