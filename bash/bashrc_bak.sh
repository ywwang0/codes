# 2022-3-26 copy
# ~/.bashrc
#

## Source global definitions


[ -f /etc/bashrc ] && source /etc/bashrc
export PATH=$HOME/bin:$HOME/opt/bin:$HOME/opt/bin/vasp5.4.4:$HOME/opt/scripts:$PATH
export LMOD_COLORIZE=YES
### add spack and private module files on this account

### enable functions for MP Envs on mu* nodes.
[[ $HOSTNAME =~ mu0 ]] && [ -e $HOME/.bash-mpenvrc ] && source $HOME/.bash-mpenvrc

### account alias

alias ls='ls --color=auto'
# alias gz='gunzip *'
alias arm='srun -p debugarm -n 1  --pty /bin/bash'
alias htop='htop -u $(whoami)'
alias sacct='sacct -o JobID,JobName%20,Partition,AllocCPUS,Start,Elapsed,Timelimit,State,ExitCode'
alias squeue='squeue -u $(whoami) -o "%.8i %.10P %.20j %.2t %.10M %.2D %.20R %Z"| sed "s|N[ODES]\+|NN|"| sed "s|${HOME}|~|"'
alias sinfo='sinfo -t idle,mix'
# alias tar='tar -zxvf'
alias enable_spack="export SPACK_ROOT=$HOME/opt/spack-git; source $SPACK_ROOT/share/spack/setup-env.sh"

#### Wang Yaowei  Settings Start ####
function use_wyw(){
  conda activate atomate_wyw
  export FW_CONFIG_FILE=/lustre/home/acct-umjzhh/umjzhh-3/qiuhao_wen/envs/atomate/config/FW_config.yaml
  export DB_LOC=/lustre/home/acct-umjzhh/umjzhh-3/qiuhao_wen/envs/atomate/dbs
}

#export PATH=$HOME/opt/wyw_scripts:$PATH
#alias srun="srun -p small -n 32  --pty /bin/bash"
alias use_wyw='export FW_CONFIG_FILE=/lustre/home/acct-umjzhh/umjzhh-3/wyw/envs/atomate/config/FW_config.yaml;conda activate atomate_wyw'
alias get="bash  /lustre/home/acct-umjzhh/umjzhh-3/opt/wyw_scripts/auto.sh"
alias submit="bash  /lustre/home/acct-umjzhh/umjzhh-3/opt/wyw_scripts/submit.sh"
alias submita="bash  /lustre/home/acct-umjzhh/umjzhh-3/opt/wyw_scripts/submit_arm.sh"
alias submitsmall="bash /lustre/home/acct-umjzhh/umjzhh-3/opt/wyw_scripts/submit_small.sh"
alias dobader="chgsum.pl AECCAR0 AECCAR2; bader CHGCAR -ref CHGCAR_sum;cat ACF.dat"
alias ll="ls -a"
alias sub="sbatch ~/bin/vasp_wyw.slurm"
alias suba="sbatch ~/bin/vasp_arm.slurms"
alias subs="sbatch ~/bin/vasp_std_small.slurm"
alias use_py2='conda activate py2'
alias judge='bash ~/opt/wyw_scripts/judge.sh'
#export PATH=$HOME/opt/wyw_scripts:$PATH
#export PATH=$HOME/opt/vaspkit.1.12:$PATH

#### Wang Yaowei  Settings End  ####

#### Xu Jialiang Settings Start ####

#export PATH=$HOME/xjl/atat/bin:$PATH
#export PATH=$HOME/opt/vtstscripts-939:$PATH
#export PATH=$HOME/opt/Bader/:$PATH
#export PATH=$HOME/opt/lobster/lobster-3.1.0/:$PATH

alias use_xjl='env MP_LAUNCH_ROOT=$HOME/xjl/ht_row/blocks; conda activate xjl_atomate'

#function use_xjl()
#{
#alias "env MP_LAUNCH_ROOT=$HOME/xjl/ht_row/blocks activate_env xjl xjl atomate"
#}
function use_casm(){
  conda activate casm
  module purge; module load gcc/4.8 casm
}

#### Xu Jialiang Settings End ####


#### Qiuhao Wen Setting Start ####

function use_wqh(){
  conda activate atomate_qiuhao
  export FW_CONFIG_FILE=/lustre/home/acct-umjzhh/umjzhh-3/qiuhao_wen/envs/atomate/config/FW_config.yaml
  export DB_LOC=/lustre/home/acct-umjzhh/umjzhh-3/qiuhao_wen/envs/atomate/config/dbs
  alias kit="/lustre/home/acct-umjzhh/umjzhh-3/qiuhao_wen/opt/vaspkit.0.73/bin/vaspkit"
  alias subwen="sbatch /lustre/home/acct-umjzhh/umjzhh-3/bin/submit_wen.slurm"
  alias getfws="lpad get_fws -d more -i $1"
  alias qr="qlaunch rapidfire"
 # export PATH=/lustre/home/acct-umjzhh/umjzhh-3/qiuhao_wen/opt/vtstscripts-940:$PATH
 # export PATH=/lustre/home/acct-umjzhh/umjzhh-3/qiuhao_wen/bin:${PATH}
 # export PATH=/lustre/home/acct-umjzhh/umjzhh-3/qiuhao_wen/opt/atat/bin:${PATH}
 # export PATH=/lustre/home/acct-umjzhh/umjzhh-3/qiuhao_wen/opt/boltztrap/icc16:${PATH}
}

function use_wqh_kpts(){
  conda activate atomate_testKPTS
  export FW_CONFIG_FILE=/lustre/home/acct-umjzhh/umjzhh-3/qiuhao_wen/envs/atomate/config/FW_config.yaml
  export DB_LOC=/lustre/home/acct-umjzhh/umjzhh-3/qiuhao_wen/envs/atomate/config/dbs
  alias kit="/lustre/home/acct-umjzhh/umjzhh-3/qiuhao_wen/opt/vaspkit.0.73/bin/vaspkit"
  alias subwen="sbatch /lustre/home/acct-umjzhh/umjzhh-3/bin/submit_wen.slurm"
  alias getfws="lpad get_fws -d more -i $1"
  alias qr="qlaunch rapidfire"
 # export PATH=/lustre/home/acct-umjzhh/umjzhh-3/qiuhao_wen/opt/vtstscripts-940:$PATH
 # export PATH=/lustre/home/acct-umjzhh/umjzhh-3/qiuhao_wen/bin:${PATH}
 # export PATH=/lustre/home/acct-umjzhh/umjzhh-3/qiuhao_wen/opt/atat/bin:${PATH}
 # export PATH=/lustre/home/acct-umjzhh/umjzhh-3/qiuhao_wen/opt/boltztrap/icc16:${PATH}
}

function use_wqh3(){
  conda activate atomate_qiuhao_3rd
  export FW_CONFIG_FILE=/lustre/home/acct-umjzhh/umjzhh-3/qiuhao_wen/envs/atomate/config/FW_config.yaml
  export DB_LOC=/lustre/home/acct-umjzhh/umjzhh-3/qiuhao_wen/envs/atomate/dbs
  alias kit="/lustre/home/acct-umjzhh/umjzhh-3/qiuhao_wen/opt/vaspkit.0.73/bin/vaspkit"
  alias subwen="sbatch /lustre/home/acct-umjzhh/umjzhh-3/bin/submit_wen.slurm"
 # export PATH=/lustre/home/acct-umjzhh/umjzhh-3/qiuhao_wen/opt/vtstscripts-940:$PATH
 # export PATH=/lustre/home/acct-umjzhh/umjzhh-3/qiuhao_wen/bin:${PATH}
}

export PATH=/lustre/home/acct-umjzhh/umjzhh-3/qtang/vtstscripts-937:$PATH
alias gib="echo -e '5\n501\n298.15' | vaspkit"
#### Qiuhao Wen Setting End ####


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/lustre/home/acct-umjzhh/umjzhh-3/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/lustre/home/acct-umjzhh/umjzhh-3/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/lustre/home/acct-umjzhh/umjzhh-3/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/lustre/home/acct-umjzhh/umjzhh-3/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#export PATH=/lustre/home/acct-umjzhh/umjzhh-3/wyw/vaspkit.1.12/bin:${PATH}
#export PATH=/lustre/home/acct-umjzhh/umjzhh-3/opt/vaspkit.1.12/bin:${PATH}
