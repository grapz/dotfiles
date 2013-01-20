require 'rake'
require 'erb'

desc 'install the dotfiles into home folder'
task :install do
  update_submodules
  replace_all = false
  link_folder('bin')
  Dir['*'].each do |file|
    next if %w[Rakefile .git bin].include? file
    
    if File.exist?(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")
        puts "identical ~/.#{file.sub('.erb', '')}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file.sub('.erb', '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub('.erb', '')}"
        end
      end
    else
      link_file(file)
    end
  end
end

def link_folder(folder)
  if File.exist?(File.join(ENV['HOME'], folder))
    print "Overwrite ~/#{folder}? [ynq] "
    case $stdin.gets.chomp
    when 'y'
      system %Q{rm -rf "$HOME/#{folder}"}
      puts "Linking ~/#{folder}"
      system %Q{ln -s "$PWD/#{folder}" "$HOME/#{folder}"}
    when 'q'
      exit
    else
      puts "Skipping ~/#{folder}"
    end
  else
    puts "Linking ~/#{folder}"
    system %Q{ln -s "$PWD/#{folder}" "$HOME/#{folder}"}
  end
end

def update_submodules()
  system %Q{git submodule init}
  system %Q{git submodule update}
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub('.erb', '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end
