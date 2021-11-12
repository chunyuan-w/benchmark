
For debug
```bash
# llga
DNNL_GRAPH_CONSTANT_CACHE=1 OMP_NUM_THREADS=1  python -u run.py densenet121 --fuser llga -d cpu -m jit -t eval

# cpu
DNNL_GRAPH_CONSTANT_CACHE=1 OMP_NUM_THREADS=1  python -u run.py densenet121 -d cpu -m jit -t eval
```