#!/bin/bash

set -xueo pipefail

sudo dnf -y install fedora-workstation-repositories
sudo dnf config-manager --set-enabled google-chrome

sudo dnf update -y

# Instalando os programas que eu gosto, para trabalho e diversão.
sudo dnf -y install asciiquarium.noarch
sudo dnf -y install bashtop
sudo dnf -y install clamav clamtk
sudo dnf -y install cowsay
sudo dnf -y install discord.x86_64
sudo dnf -y install evolution.x86_64
sudo dnf -y install figlet.x86_64
sudo dnf -y install filezilla.x86_64
sudo dnf -y install firefox.x86_64
sudo dnf -y install fish
sudo dnf -y install fontawesome-fonts-web.noarch
sudo dnf -y install gimp
sudo dnf -y install git
sudo dnf -y install google-chrome-stable
sudo dnf -y install google-croscore-fonts-common.noarch
sudo dnf -y install google-droid-fonts-all.noarch
sudo dnf -y install google-droid-sans-mono-fonts
sudo dnf -y install gpick.x86_64
sudo dnf -y install htop.x86_64
sudo dnf -y install ibm-plex-fonts-common.noarch
sudo dnf -y install jetbrains-mono-fonts-all.noarch
sudo dnf -y install julietaula-montserrat-fonts-common.noarch
sudo dnf -y install libreoffice-icon-theme-papirus.noarch
sudo dnf -y install libreoffice-langpack-pt-BR.x86_64
sudo dnf -y install lolcat.x86_64
sudo dnf -y install neofetch.noarch
sudo dnf -y install numlockx.x86_64
sudo dnf -y install obs-studio.x86_64
sudo dnf -y install qt5-designer.x86_64
sudo dnf -y install R.x86_64
sudo dnf -y install rstudio.x86_64
sudo dnf -y install R-rstudioapi.noarch
sudo dnf -y install remmina
sudo dnf -y install sl
sudo dnf -y install sqlitebrowser
sudo dnf -y install tilix.x86_64
sudo dnf -y install toilet.x86_64
sudo dnf -y install vlc.x86_64
sudo dnf -y install xcowsay.x86_64
sudo dnf -y install xorgxrdp
sudo dnf -y install xpad.x86_64
sudo dnf -y install xrdp

sudo freshclam

# instalando o thema Flat Remix no terminal e no usuário corrente
sudo dnf -y install flat-remix-gtk3-theme.noarch
bash -c "$(curl -sLo- https://git.io/JvvDs)"

# Instalando o Plank corretamente
# Renomeando o repositório do fedora pois o plank que tem lá
# não aceita a configuração de zoom dos icones.
# E instalando o plank do repositório do copr
# depois de instalado eu volto o repositório do fedora
# mas, adiciono a exclusão de atualização do plank
# no dnf.conf evidando que ele atualize pelo repo
# da fedora e desconfigure tudo.
# NÃO USO MAIS, ACHO A BARRA DO CINNAMON MAIS PRÁTICA, MAS ESSA INSTALAÇÃO FUNCIONA #
#sudo dnf -y copr enable decathorpe/elementary-nightly
#sudo dnf -y copr enable daniruiz/flat-remix
#sudo dnf update -y
#sudo mv /etc/yum.repos.d/fedora.repo fedora.repo.bkp
#sudo dnf -y install plank.x86_64
#sudo dnf -y install plank-docklets.x86_64
#sudo dnf -y install elementary-theme-plank.noarch
#sudo sed -i.bak '2i exclude=plank\nexclude=plank-docklets' /etc/dnf/dnf.conf
#sudo mv /etc/yum.repos.d/fedora.repo.bkp fedora.repo

# Instalando o VSCodium
sudo rpm --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=gitlab.com_paulcarroty_vscodium_repo\nbaseurl=https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg" |sudo tee -a /etc/yum.repos.d/vscodium.repo
sudo dnf -y install codium

# Instalando o ambiente de virtualização
sudo dnf -y install @virtualization
sudo dnf -y install virt-top libguestfs-tools

# Instalei esse novo browser para testar, ainda não tenho opinião sobre ele, tem propaganda dele mar barra as dos sites.
sudo dnf -y config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf -y install brave-keyring brave-browser

# Instalando o programas para acessar as maquinas
wget https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm -O teamviewer.rpm
sudo dnf -y install teamviewer.rpm

# Instalando meus modulos basicos de python
sudo dnf -y install -y python3.x86_64 \
    python-crypto \
    python-devel \
    python-dns \
    python-markdown \
    python2-gpg \
    python2-tkinter.x86_64 \
    python3-tkinter.x86_64 \
    python3 \
    python3-crypto \
    python3-devel \
    python3-dns \
    python3-gpg \
    python3-markdown \
    python3-ldap3.noarch \
    python-vlc \
    
pip install PyQt5 pyside2

# Instalando e configurando minha área de trabalho para acessar de fora
# não se angane, não é só isso, há muito mais segredos nesta configuração rsrs
sudo systemctl start xrdp
sudo systemctl enable xrdp

sudo systemctl start libvirtd
sudo systemctl enable libvirtd

sudo firewall-cmd --add-port=3389/tcp --permanent
sudo firewall-cmd --reload

sudo dnf -y clean all
