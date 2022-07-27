require 'fileutils'

def create_dir
  Dir.exist?('./data') ? nil : create_files
end