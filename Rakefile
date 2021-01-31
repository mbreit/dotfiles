# frozen_string_literal: true

desc 'Install dotfiles to your home directory'
task install: %w[submodules:init install:vim install:zsh install:tmux install:fish install:git]

namespace 'install' do
  desc 'Install vim configuration'
  task :vim do
    link_file '.vimrc', from: 'vim'
    link_file 'vim', as: '.vim'
  end

  desc 'Install zsh configuration'
  task :zsh do
    link_file '.zshrc', from: 'zsh'
  end

  desc 'Install tmux configuration'
  task :tmux do
    link_file '.tmux.conf', from: 'tmux'
  end

  desc 'Install fish configuration'
  task :fish do
    link_file 'fish', to: '.config'
  end

  desc 'Install git configuration'
  task :git do
    link_file 'git', to: '.config'
  end
end

namespace :submodules do
  task :init do
    sh 'git submodule update --init'
  end

  desc 'Update submodules from their repositories'
  task :update do
    sh 'git submodule update --remote'
  end
end

desc 'Update dotfiles and dependencies'
task update: %i[update:repository submodules:init submodules:update]

namespace :update do
  desc 'Update dotfiles git repository'
  task :repository do
    sh 'git stash && git pull --rebase && git stash pop'
  end
end

def backup(target)
  return unless File.exist?(target) || File.symlink?(target)

  puts "File #{target} already exists, creating backup..."
  File.rename(target, target + ".backup-#{Time.now.strftime('%F-%H%M%S')}")
end

def link_file(filename, from: '', to: '', as: File.basename(filename))
  target = File.join(Dir.home, to, as)
  source = File.join(__dir__, from, filename)
  backup(target)
  FileUtils.ln_s(source, target)
end
