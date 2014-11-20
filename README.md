pretty_sql
==========

SQL formatting and syntax highlighting, for debugging.

Note
====

If you want syntax highlighing, install the python package pygments: http://pygments.org/docs/cmdline/ and ensure that it's in your PATH.

Sample usage:
=============

### In this example we're monkeypaching String to add a to_prety_sql method.

    require 'pretty_sql'

    class String

      include PrettySql

      def to_pretty_sql
        prettify_sql(self.dup)
      end
    end

    puts 'SELECT * FROM poop'.to_pretty_sql
