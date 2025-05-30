import os
from dataclasses import dataclass

@dataclass
class Config:
    benchmarks_graph_path: str
    benchmarks_smt_path: str
    benchmarks_code_path: str
    esbmc_bin_path: str
    deepseek_api_url: str

config = Config(
    benchmarks_graph_path="benchmarks/linear/c_graph/",
    benchmarks_smt_path="benchmarks/linear/c_smt2/",
    benchmarks_code_path="benchmarks/linear/c/",
    esbmc_bin_path="esbmc",
    deepseek_api_url="https://api.deepseek.com"
)
