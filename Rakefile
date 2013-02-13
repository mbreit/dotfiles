desc "Install dotfiles to your home directory"
task :install => %w(install:banner install:packages submodules:init install:vim install:zsh install:tmux)

namespace "install" do
  task :banner do
    puts "Installing dotfiles..."
  end

  desc "Install required debian packages"
  task :packages do
    sh "sudo apt-get install vim zsh tmux git"
  end

  desc "Install vim configuration"
  task :vim do
    link_to_home "vim", ".vimrc"
    link_file("vim", ENV["HOME"], ".vim")
  end

  desc "Install zsh configuration"
  task :zsh do
    link_to_home "zsh", ".zshrc"
  end

  desc "Install tmux configuration"
  task :tmux do
    link_to_home "tmux", ".tmux.conf"
  end

  desc "Install powerline fonts"
  task :fonts do
    sh "mkdir -p ~/.fonts && cd ~/.fonts && git clone https://github.com/Lokaltog/powerline-fonts.git"
  end
end

namespace :submodules do
  task :init do
    sh "git submodule update --init"
  end

  desc "Update submodules from their repositories"
  task :update do
    sh "git submodule foreach 'git checkout $(git config --file $toplevel/.gitmodules submodule.$name.branch) && git pull'"
  end
end

desc "Update dotfiles and dependencies"
task :update => [:'update:repository', :'submodules:update']

namespace :update do
  desc "Update dotfiles git repository"
  task :repository do
    sh "git pull --rebase"
  end
end

def link_file(filename, dir, target_name = nil)
  target = File.join(dir, (target_name || File.basename(filename)))
  source = File.join(ENV['PWD'], filename)
  backup(target)
  FileUtils.ln_s(source, target)
end

def backup(target)
  if File.exist?(target) || File.symlink?(target)
    puts "File #{target} already exists, creating backup..."
    File.rename(target, target + ".backup-#{Time.now.strftime("%F-%H%M%S")}")
  end
end

def link_to_home(dir, *files)
  files.each do |file|
    link_file(File.join(dir, file), ENV["HOME"])
  end
end
