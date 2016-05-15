# written by kazuya

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# LANG
export LC_ALL=C.UTF-8
export LANG=C.UTF-8

# Screen
if [ ! -d /var/run/screen ]; then
	sudo mkdir /var/run/screen
	sudo chmod 0777 /var/run/screen
fi

# Open jupyter notebook if not running
if [ `ps aux | grep jupyter-notebook | wc -l` -eq 1 ]; then
    nohup jupyter-notebook > /dev/null &
fi

# Enable C-s -> I-search
stty stop undef

. ~/.bashrc

