# cobble

A simple and easy way to query Hugging Face for a quant you are looking for, download it, and run it with [KoboldCpp](https://github.com/LostRuins/koboldcpp).

Given a model path and quant type, `cobble` automatically finds and downloads a suitable quant, then loads it with KoboldCpp. If a KoboldCpp executable is not found, `cobble` will download the latest one.

Only Linux is supported, and currently only the CUDA version of KoboldCpp is supported.

## Installation

```bash
git clone https://github.com/gnew33/cobble
cd cobble
./install.sh
```

## Usage

```
~ $ cobble
error: the following arguments are required: model_path, kobold_args

usage: cobble <model_path> [quant_type] [-n/--no-run] [kobold_args]

Download and optionally run a quantized model.

positional arguments:
  model_path    the path to the model on Hugging Face, e.g. "meta-llama/Meta-Llama-3-8B"
  quant_type    (optional) the quantization type, can be any string. Default: Q5_K_M
  kobold_args   additional arguments to pass to KoboldCpp

options:
  -h, --help    show this help message and exit
  -n, --no-run  do not run the model after downloading
```

Example:

```
~ $ cobble TheDrummer/Cydonia-22B-v1 Q5_K_L --contextsize 12288
Cydonia-22B-v1-Q5_K_L.gguf: 100%|███████| 14.8G/14.8G [03:48<00:00, 69.2MiB/s]
Download complete: /home/gnew33/Downloads/Cydonia-22B-v1-Q5_K_L.gguf
koboldcpp not found. Downloading...
koboldcpp-linux-x64-cuda1210: 100%|███████| 630M/630M [00:07<00:00, 93.8MiB/s]
Download complete: /home/gnew33/Downloads/koboldcpp-linux-x64-cuda1210
Using KoboldCpp at: /home/gnew33/Downloads/koboldcpp-linux-x64-cuda1210
/home/gnew33/Downloads/koboldcpp-linux-x64-cuda1210 --model /home/gnew33/Downloads/Cydonia-22B-v1-Q5_K_L.gguf --contextsize 12288
***
Welcome to KoboldCpp - Version 1.75.2
No GPU or CPU backend was selected. Trying to assign one for you automatically...
Auto Selected CUDA Backend...
...
```
