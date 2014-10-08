require 'rake/extensiontask'

spec = Gem::Specification.load('byebug.gemspec')

Rake::ExtensionTask.new('byebug', spec) do |ext|
  ext.lib_dir = 'lib/byebug'
  ext.cross_compile = true if RUBY_PLATFORM !~ /mswin|mingw/
  ext.cross_platform = 'x86-mingw32'
end

require 'rake/testtask'

module Rake
  #
  # Overrides default rake tests loader
  #
  class TestTask
    def rake_loader
      'test/test_helper.rb'
    end
  end
end

desc 'Run the test suite'
task :test do
  Rake::TestTask.new do |t|
    t.verbose = true
    t.warning = true
    t.pattern = 'test/**/*_test.rb'
  end
end

#
# Prepend DevKit into compilation phase
#
if RUBY_PLATFORM =~ /mingw/
  task compile: :devkit
  task native: :devkit
end

desc 'Activates DevKit'
task :devkit do
  begin
    require 'devkit'
  rescue LoadError
    abort "Failed to activate RubyInstaller's DevKit required for compilation."
  end
end

task default: [:clean, :compile, :test]
