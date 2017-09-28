#!/bin/bash
jupyter nbextension enable --py --sys-prefix widgetsnbextension

# Install the wrapper kernels. Do pip show sparkmagic and it will show the path where sparkmagic is installed at. cd to that location and do:
cd /opt/conda/lib/python3.5/site-packages
jupyter-kernelspec install sparkmagic/kernels/sparkkernel
jupyter-kernelspec install sparkmagic/kernels/pysparkkernel
jupyter-kernelspec install sparkmagic/kernels/pyspark3kernel
jupyter-kernelspec install sparkmagic/kernels/sparkrkernel


# Enable the server extension so that clusters can be programatically changed:
jupyter serverextension enable --py sparkmagic

