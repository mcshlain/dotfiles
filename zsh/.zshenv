# local bin
export PATH=$PATH:$HOME/.local/bin

# Apps bin
export PATH=$PATH:$HOME/apps/bin

# Shen
export PATH=$PATH:$HOME/apps/shen/latest/Platforms/SBCL

# Lein (clojure build)
export PATH=$PATH:$HOME/apps/lein/bin

# java stuff
export JAVA_HOME=/usr/lib/jvm/java-1.17.0-openjdk-amd64
export ANT_HOME=/usr/share/ant
export PATH=$PATH:$ANT_HOME/bin

# added by Miniconda2 4.3.11 installer
#export CONDA_HOME=$HOME/apps/conda
#export PATH=$PATH:$CONDA_HOME/bin
#export PYTHONPATH=$PYTHONPATH:$CONDA_HOME/lib/python3.7/site-packages

# add hadoop stuff
export HADOOP_HOME=$HOME/apps/hadoop/latest
export PATH=$PATH:$HADOOP_HOME/sbin
export PATH=$PATH:$HADOOP_HOME/bin

# add hive stuff
export HIVE_HOME=$HOME/apps/hive/latest
export PATH=$PATH:$HIVE_HOME/bin

# add pig stuff
export PIG_HOME=$HOME/apps/pig/latest
export PATH=$PATH:$PIG_HOME/bin
export PIG_CLASSPATH=$HADOOP_HOME/etc/hadoop

# add scala stuff
export SCALA_HOME=$HOME/apps/scala/latest
export PATH=$PATH:$SCALA_HOME/bin

# add spark stuff
export SPARK_HOME=$HOME/apps/spark/latest
export PATH=$PATH:$SPARK_HOME/bin

# Add local bin (needed for python --user installs)
export PATH="${HOME}/.local/bin:$PATH"


export NVM_HOME="${HOME}/.nvm"
export PATH=$PATH:$NVM_HOME

