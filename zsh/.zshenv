# local bin
export PATH=$PATH:$HOME/.local/bin

# Apps bin
export PATH=$PATH:$HOME/apps/bin

# java stuff
export JAVA_HOME=/usr/lib/jvm/java-1.17.0-openjdk-amd64
export ANT_HOME=/usr/share/ant
export PATH=$PATH:$ANT_HOME/bin

# Add local bin (needed for python --user installs)
export PATH="${HOME}/.local/bin:$PATH"

export NVM_HOME="${HOME}/.nvm"
export PATH=$PATH:$NVM_HOME

