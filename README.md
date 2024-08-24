Работает с podman а не docker
нужно установить podman , перед сборкой образа в wsl2 нужно ввести команды иначе не собирается

sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy

Перед запуском run.sh сначала необходимо собрать образы с помощью build.sh


запускать нужно из каталога роли , при этом по пути каталога будет выполнен поиск инвентори и плейбука
пример 

role\tests\antest\site.yml
role\tests\antest\inventory\hosts.yml

в run.sh необходимо указать путь до каталога antest

readonly ANTEST_PROJECT_DIR="/home/wsl/ansible/antest/"
