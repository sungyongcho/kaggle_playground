#!/bin/zsh

export MYPATH="/Users/$USER/Documents/miniconda3/"

if [[ "$(uname)" == "Darwin" ]]; then
	# For MAC
	curl -LO "https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh"
	sh Miniconda3-latest-MacOSX-arm64.sh -b -p $MYPATH
elif [[ "$(uname)" == "Linux" ]]; then
	curl -LO "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"
	sh Miniconda3-latest-Linux-x86_64.sh -b -p $MYPATH
fi

# For zsh
$MYPATH/bin/conda init zsh
$MYPATH/bin/conda config --set auto_activate_base false
source ~/.zshrc

# For bash
# $MYPATH/bin/conda init bash
# $MYPATH/bin/conda config --set auto_activate_base false
# source ~/.bash_profile

conda create --name kaggle-playground python=3.11 jupyter pandas pycodestyle numpy scikit-learn matplotlib networkx black missingno prettytable tqdm xgboost statsmodels lightgbm bayesian-optimization  -y

pip install catboost imbalanced-learn
