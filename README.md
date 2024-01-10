Перед запуском run.sh сначала необходимо собрать образы с помощью build.sh

запускать нужно из каталога роли , при этом по пути каталога будет выполнен поиск инвентори и плейбука
пример 
role\tests\antest\site.yml
role\tests\antest\inventory\hosts.yml

в run.sh необходимо указать путь до каталога antest
readonly ANTEST_PROJECT_DIR="/home/wsl/ansible/antest/"
