# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi


# User specific environment and startup programs ===================================================


PATH=$HOME/.local/bin:$HOME/bin:$HOME/opt/neovim/bin:$HOME/node_modules/.bin:$PATH
C_INCLUDE_PATH=$HOME/include:$C_INCLUDE_PATH
CPLUS_INCLUDE_PATH=$HOME/include:$CPLUS_INCLUDE_PATH
LD_LIBRARY_PATH=$HOME/lib:$HOME/lib64:/usr/lib:/usr/lib64:$LD_LIBRARY_PATH

# Rust
source $HOME/.cargo/env
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# Steam
export STEAM_RUNTIME_PREFER_HOST_LIBRARIES=0


# Source variables =================================================================================

PATH=$HOME/src/phab/arcanist/bin:$PATH
if [ -f $HOME/src/phab/arcanist/resources/shell/bash-completion ]; then
	source $HOME/src/phab/arcanist/resources/shell/bash-completion
fi

if [ -f $HOME/.config/exercism/exercism_completion.bash ]; then
	source $HOME/.config/exercism/exercism_completion.bash
fi


# Blender variables
export B3D_PY_PATH=/opt/lib/python-3.6
CUDA_PATH=/usr/local/cuda
PATH=$CUDA_PATH/bin:$HOME/blender:$PATH
C_INCLUDE_PATH=$CUDA_PATH/include:/opt/lib/openvdb/include:$B3D_PY_PATH/include:$C_INCLUDE_PATH
CPLUS_INCLUDE_PATH=$CUDA_PATH/include:/opt/lib/openvdb/include:$B3D_PY_PATH/include:$CPLUS_INCLUDE_PATH
LD_LIBRARY_PATH=$CUDA_PATH/lib64:$B3D_PY_PATH/lib:$LD_LIBRARY_PATH
# CYCLES_CUDA_ADAPTIVE_COMPILE=1


# Maya variables
MAYA_APP_DIR=$HOME/maya
MAYA_MODULE_PATH=$HOME/maya/modules
RMANTREE=/opt/pixar/RenderManProServer-21.6
RMSTREE=/opt/pixar/RenderManStudio-21.6-maya2016.5
PATH=$RMSTREE/bin:$HOME/bin:opt/pixar/RenderManProServer-21.6/bin:$PATH


# Export ===========================================================================================

# export PYTHONPATH
export PATH
export C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH
export LD_LIBRARY_PATH

export MAYA_APP_DIR
export MAYA_MODULE_DIR
export RMANTREE
export RMSTREE
