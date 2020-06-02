#!/bin/bash

set -xueo pipefail

sudo dnf -y install fedora-workstation-repositories

sudo dnf update -y

sudo dnf -y install clamav clamtk
sudo freshclam
sudo dnf config-manager --set-enabled google-chrome
sudo dnf -y install google-chrome-stable
sudo dnf -y install numlockx.x86_64
sudo dnf -y install remmina
sudo dnf -y install xpad.x86_64
sudo dnf -y install htop.x86_64
sudo dnf -y install git
sudo dnf -y install sl
sudo dnf -y install gimp
sudo dnf -y install vlc.x86_64
sudo dnf -y install cowsay
sudo dnf -y install xcowsay.x86_64
sudo dnf -y install toilet.x86_64
sudo dnf -y install lolcat.x86_64
sudo dnf -y install neofetch.noarch
sudo dnf -y install asciiquarium.noarch
sudo dnf -y install xrdp
sudo dnf -y install xorgxrdp
sudo dnf -y install bashtop
sudo dnf -y install filezilla.x86_64
sudo dnf -y install figlet.x86_64
sudo dnf -y install tilix.x86_64
sudo dnf -y install discord.x86_64
sudo dnf -y install gpick.x86_64
sudo dnf -y install fish
sudo dnf -y install libreoffice-langpack-pt-BR.x86_64
sudo dnf -y install libreoffice-icon-theme-papirus.noarch

# Instalando repositórios legais
sudo dnf -y copr enable decathorpe/elementary-nightly
sudo dnf -y copr enable daniruiz/flat-remix

sudo dnf update -y

# instalando o Plank corretamente
sudo mv /etc/yum.repos.d/fedora.repo fedora.repo.bkp
sudo dnf -y install plank.x86_64
sudo dnf -y install plank-docklets.x86_64
sudo dnf -y install elementary-theme-plank.noarch
sudo sed -i.bak '2i exclude=plank\nexclude=plank-docklets' /etc/dnf/dnf.conf
sudo mv /etc/yum.repos.d/fedora.repo.bkp fedora.repo

# instalando o thema Flat Remix no terminal e no usuário corrente
sudo dnf -y install flat-remix-gtk3-theme.noarch
bash -c "$(curl -sLo- https://git.io/JvvDs)"

# Instalando o VSCodium
sudo rpm --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg
sudo printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=gitlab.com_paulcarroty_vscodium_repo\nbaseurl=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg" |sudo tee -a /etc/yum.repos.d/vscodium.repo
sudo dnf -y install codium

# Instalando o ambiente de virtualização
sudo dnf -y install @virtualization
sudo dnf -y install virt-manager bridge-utils libvirt virt-install qemu-kvm
sudo dnf -y install virt-top libguestfs-tools

sudo dnf -y config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf -y install brave-keyring brave-browser

wget https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm -O teamviewer.rpm
sudo dnf -y install teamviewer.rpm

sudo dnf -y install python3.x86_64 \
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

sudo systemctl start xrdp
sudo systemctl enable xrdp

sudo systemctl start libvirtd
sudo systemctl enable libvirtd

sudo firewall-cmd --add-port=3389/tcp --permanent
sudo firewall-cmd --reload

sudo dnf -y clean all
