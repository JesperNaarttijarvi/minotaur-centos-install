# Minotaur centos installer

## Prerequierments
For now the installer installs nvidia and cude. Will be decapitated in the future

This installation is tested with a fresh install of centos 7 minimal server
- Nvidia driver > 387.26    | check below if needed to install
- Cuda driver > 9.0         | check below if needed to install
- Git (used for git clone)  | check below if needed to install

# Install nvidia drivers
````
Released next commit
````

# Install Cuda driver 
````
Released next commit
````

# Install git
````
yum install git
````


## Overview

From a clean centos install, this will install:

- Dependencies (most of them are in /roles/systems/tasks/main.yml)
- Python requierments (Python-pip, python-setuptools, python-dev)
- Minotaur
- gpustatd
- Excavataur
and miners: excavator, ccminer, ccminer2 and ethminer.

This installation will also set up Xorg file with all gpus appended to Display 0

All will run on startup. You should adjust the configuration to your needs.

## Installation

````
Log in as root
cd ~
git clone https://github.com/JesperNaarttijarvi/minotaur-centos-install.git
cd minotaur-install-centos
sudo ./build.sh
````

Then reboot the system.

This will deploy:

- xorg with appropriate config for all Nvidia devices on the system. Appending all gpus on display 0 and coolbits 28
- a "miner" user to run the applications with
- gpustatd - starting on boot
- excavator - starting on boot
- excavataur - starting on boot
- ccminer
- ccminer2
- ethminer
- gs display for minotaur - starting on boot

minotaur itself will not start on boot but you can change this by uncommenting
the line for it in /etc/rc.local. First you will probably want to do some
calibration though - see the README in the minotaur project for details.

## Usage

All of the startup applications will run in screen sessions owned by the miner
user. You should run minotaur as the miner user, eg:

````
sudo su miner
````

then you can see the list of screen sessions with:

````
screen -list
````

jump into one with -r, eg to see the gs display:

````
screen -r gs
````

to exit from a screen session press ctrl-a and then d.

## Disclaimer

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.


## Credits
All credits go to Mark Wadham and the minotaur project 
