wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
source ~/.bashrc
conda env create --file lyra.yaml
# Activate the lyra conda environment.
conda activate lyra
# Install the dependencies.
pip install -r requirements_gen3c.txt
pip install -r requirements_lyra.txt
# Patch Transformer engine linking issues in conda environments.
ln -sf $CONDA_PREFIX/lib/python3.10/site-packages/nvidia/*/include/* $CONDA_PREFIX/include/
ln -sf $CONDA_PREFIX/lib/python3.10/site-packages/nvidia/*/include/* $CONDA_PREFIX/include/python3.10
# Install Transformer engine.
pip install transformer-engine[pytorch]==1.12.0
# Install Apex for inference.
git clone https://github.com/NVIDIA/apex
CUDA_HOME=$CONDA_PREFIX pip install -v --disable-pip-version-check --no-cache-dir --no-build-isolation --config-settings "--build-option=--cpp_ext" --config-settings "--build-option=--cuda_ext" ./apex
# Install MoGe for inference.
pip install git+https://github.com/microsoft/MoGe.git
# Install Mamba for reconstruction model.
pip install --no-build-isolation "git+https://github.com/state-spaces/mamba@v2.2.4"
