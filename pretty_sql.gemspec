Gem::Specification.new do |s|
  s.name        = 'pretty_sql'
  s.version     = '0.1.0'
  s.date        = '2014-11-19'
  s.summary     = 'Indents and colorizes SQL'
  s.description = 'Uses pygmentize and anbt-sql-formatter to auto-indent and colorize SQL'
  s.authors     = ["Benoit C. Sirois"]
  s.email       = 'benoitcsirois@gmail.com'
  s.files       = ["lib/pretty_sql.rb"]
  s.license     = 'MIT'
  s.homepage    = 'https://github.com/benwah/pretty_sql'
  s.add_dependency('anbt-sql-formatter', '~> 0.0.2')
end
