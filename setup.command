#!/usr/bin/env bash

# найдем директорию, в которой лежит файл исполняемого срипта
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# перейдем в нее
cd "$DIR"

# установка Bundler, если необходимо
if hash bundler 2>/dev/null; 
then
    echo Bundler is installed
else    
    sudo gem install bundler
fi

# установка HomeBrew, если необходимо
if hash brew 2>/dev/null; 
then
    echo HomeBrew is installed
else    
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# установка xcodegen, если необходимо
if hash xcodegen 2>/dev/null; 
then
    echo xcodegen is installed
else    
    brew install xcodegen
fi

# Проверка установки Carthage
if hash carthage 2>/dev/null; 
then
    echo Carthage is installed
else    
    brew install carthage
fi

if hash needle 2>/dev/null;
then
    echo needle is installed
else 
    brew install needle
fi

# создаем Generated файлы
function mkdir_touch {
  mkdir -p "$(dirname "$1")"
  command touch "$1"
}

# генерация файла для DI
mkdir_touch Sources/DI/NeedleGenerated.swift

xcodegen generate

# Устанавливаем ruby зависимости.
# Cocoapods and Fastlane
bundle install

# Обновляем репозиторий
# bundle exec pod repo update

# Запускаем установку подов.
bundle exec pod install