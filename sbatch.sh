#!/bin/bash
#SBATCH --job-name=MyJob
#number of independent tasks we are going to start in this script
#SBATCH --ntasks=1 --cpus-per-task=4 --mem=6000M
#We expect that our program should not run longer than 2 days
#Note that a program will be killed once it exceeds this time!
#SBATCH --time=3-00:00:00
#gpu specs
#SBATCH -p gpu --gres=gpu:a100:2
#Skipping many options! see man sbatch
# From here on, we can start our program

echo "Starting..." > /home/ngw861/out.txt
git log -1 --format="%H" > /home/ngw861/00_ae/git_commit.txt
source /home/ngw861/venvs/00_ae/bin/activate
python -m pip install -r /home/ngw861/00_ae/requirements.txt -f https://download.pytorch.org/whl/torch_stable.html
export GIT_PYTHON_REFRESH=quiet
python -m scripts.train
