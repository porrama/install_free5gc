## Installing on Virtual Machine by Simple method

---

## Table of Contents
- [Software and Hardware](#id-specification)
- [Installaion Procedure](#id-installation)
- [Network Functions Testing](#id-networkfunction)
- [Reference](#id-reference)

---

<div id='id-specification'/>

## Software and Hardware

### Hardware Specification
| Module           | Detail                                         |
| -----------      | -----------                                    |
| Operating System | Windows 11 Home 21H2                           |
| Processer        | 11th Gen Intel(R) Core (TM) i5-1135G7 @2.40GHz |
| RAM              | 16.0 GB                                        |
| Graphics Card    | Intel(R) Iris(R) Xe Graphics                   |
| Connectivity     | Intel(R) Wi-Fi 6 AX201 160MHz                  |

### Software Used
| Software      | Version                 |
| -----------   | -----------             |
| VirtualBox    | VirtualBox 6.1          |
| Free5GC       | Updated Apr, 2022       |
| Ubuntu Server | Ubuntu Server 20.04 LTS |

---

<div id='id-installation'/>

## Installation Procedure

### 1. Create Virtual Machine
| Module      | Detail         |
| ----------- | -----------    |
| Memmory     | 2GB            |
| HDD         | 20GB           |
| Network     | Bridge Adapter |

### 2. Install and Setup Ubuntu Server

Clone this project
~~~
cd ~
git clone https://github.com/porrama/install_free5gc
~~~

Run **aptinstall_free5gc.sh**
~~~
cd ~/install_free5gc
sudo sh aptinstall_free5gc.sh
~~~

### 3. Install Free5GC software

Clone Free5gc project
~~~
cd ~
git clone --recursive -b v3.1.0 -j `nproc` https://github.com/free5gc/free5gc.git
~~~

Install Golang
~~~
cd ~
sudo sh install_free5gc/install_golang_wget.sh
~~~
~~~
mkdir -p ~/go/{bin,pkg,src}
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export PATH=$PATH:$GOPATH/bin:$GOROOT/bin' >> ~/.bashrc
echo 'export GO111MODULE=auto' >> ~/.bashrc
source ~/.bashrc
~~~

Install Nodejs
~~~
cd ~
sudo sh install_free5gc/install_nodejs.sh
~~~

Install all Network functions
~~~
go get -u github.com/sirupsen/logrus
~~~
~~~
cd ~/free5gc
make
~~~
~~~
cd ~/free5gc
make upf
~~~


WebConsole Install
~~~
cd ~/free5gc
make webconsole
~~~

GTP-U (UPF)
~~~
cd ~
git clone -b v0.5.3 https://github.com/free5gc/gtp5g.git
~~~
~~~
cd ~/gtp5g
make
~~~
~~~
sudo make install
~~~

---

<div id='id-networkfunction'/>

## Network Function Testing

Run **runnfv_free5gc.sh**
~~~
cd ~/free5gc
./run.sh
~~~ 

Run User Plane Function (UPF)
~~~
cd ~/free5gc/NFs/upf/build
sudo bin/free5gc-upfd
~~~ 

Run WebConsole server
~~~
cd ~/free5gc/webconsole
./bin/webconsole
~~~

---

<div id='id-reference'/>

## Reference
- [Free5GC Documentation](https://github.com/free5gc/free5gc/wiki)
- [s5uishida Project](https://github.com/s5uishida/free5gc_ueransim_sample_config)

---
