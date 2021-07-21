export OMP_NUM_THREADS=1
export DNNL_GRAPH_CONSTANT_CACHE=1

models="test_bench.py::TestBenchNetwork::test_eval[resnext50_32x4d-cpu-jit] \
test_bench.py::TestBenchNetwork::test_eval[resnet50-cpu-jit] \
test_bench.py::TestBenchNetwork::test_eval[densenet121-cpu-jit] \
test_bench.py::TestBenchNetwork::test_eval[squeezenet1_1-cpu-jit] \
test_bench.py::TestBenchNetwork::test_eval[vgg16-cpu-jit] \
test_bench.py::TestBenchNetwork::test_eval[alexnet-cpu-jit]"

pytest $models --fuser llga --benchmark-json llga.json
pytest $models --benchmark-json nollga.json
python compare.py nollga.json llga.json
