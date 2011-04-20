# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'captainslog/version'

Gem::Specification.new do |s|
  s.name        = 'captainslog'
  s.version     = Captainslog::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['John Thomas Marino']
  s.email       = 'writejm@gmail.com'
  s.homepage    = 'http://github.com/johmas/captainslog'
  s.summary     = 'captainslog formats git logs by day and author'
  s.description = %q{
    captainslog is a command line utility that prints git logs by day and by author. This is especially usefully when filling out time logs and emailing summaries of commits to clients.
  }
  s.rubyforge_project = 'captainslog'
  s.files             = %w( README.md Rakefile LICENSE )
  s.files            += Dir.glob('lib/**/*')
  s.files            += Dir.glob('bin/**/*')
  s.require_paths     = ['lib']
  s.executables       = %w( captainslog )
end
