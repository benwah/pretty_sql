require 'minitest/autorun'
require 'pretty_sql'

class PrettySqlTest < Minitest::Test
  include PrettySql

  def test_pygmentize_sql
    skip('No pygmentize executable') unless pygmentize_path
    assert_equal("\
\e[34mSELECT\e[39;49;00m \e[39;49;00m*\e[39;49;00m \e[39;49;00m\e[34mFROM\e[39;49;00m \e[39;49;00mtests\e[39;49;00m\n",
                 pygmentize_sql('SELECT * FROM tests'))
  end

  def test_tidy_sql
    assert_equal("\
SELECT
        *
    FROM
        tests", tidy_sql('SELECT * FROM tests'))
  end

  def test_prettify_sql
    skip('No pygmentize executable') unless pygmentize_path
    assert_equal("\
\e[34mSELECT\e[39;49;00m
        \e[39;49;00m*\e[39;49;00m
    \e[39;49;00m\e[34mFROM\e[39;49;00m
        \e[39;49;00mtests\e[39;49;00m\n",
                 prettify_sql('SELECT * FROM tests'))
  end
end
