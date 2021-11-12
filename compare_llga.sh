export OMP_NUM_THREADS=1
export DNNL_GRAPH_CONSTANT_CACHE=1

models="test_bench.py::TestBenchNetwork::test_eval[resnext50_32x4d-cpu-jit] \
test_bench.py::TestBenchNetwork::test_eval[resnet50-cpu-jit] \
test_bench.py::TestBenchNetwork::test_eval[densenet121-cpu-jit] \
test_bench.py::TestBenchNetwork::test_eval[squeezenet1_1-cpu-jit] \
test_bench.py::TestBenchNetwork::test_eval[vgg16-cpu-jit] \
test_bench.py::TestBenchNetwork::test_eval[alexnet-cpu-jit]"

pytest --ignore_machine_config $models --cpu_only --benchmark-json nollga.json
pytest --ignore_machine_config $models --fuser llga --cpu_only --benchmark-json llga.json
python compare.py nollga.json llga.json

# pytest --ignore_machine_config test_bench.py -k test_eval[resnet50-cpu-jit] --cpu_only --benchmark-json nollga_single_model.json
# pytest --ignore_machine_config test_bench.py -k test_eval[resnet50-cpu-jit] --fuser llga --cpu_only --benchmark-json llga_single_model.json
# python compare.py nollga_single_model.json llga_single_model.json