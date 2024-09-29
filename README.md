# cobble

A simple and easy way to query Hugging Face for a quant you are looking for, download it, and run it with [KoboldCpp](https://github.com/LostRuins/koboldcpp).

Given a model path and quant type, `cobble` automatically finds and downloads a suitable quant, then loads it with KoboldCpp. If a KoboldCpp executable is not found, `cobble` will download the latest one.

Only Linux is supported, and currently only the CUDA version of KoboldCpp is supported.

## Installation

```bash
git clone https://github.com/gnew33/cobble
cd cobble
make
```

The Makefile assumes that `~/.local/bin/` is in your `PATH`.

## Usage

```bash
~ $ cobble
error: the following arguments are required: model_path

usage: cobble <model_path> [quant_type] [-r/--run]

Download and optionally run a quantized model.

positional arguments:
  model_path    the path to the model on Hugging Face, e.g. "meta-llama/Meta-Llama-3-8B"
  quant_type    the quantization type, e.g. "Q4_K_M"; can be any string

options:
  -h, --help    show this help message and exit
  -n, --no-run  do not run the model after downloading
```
