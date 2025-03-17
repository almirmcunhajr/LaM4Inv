import z3
import re

from smt.solver import Solver, SatStatus, InvalidFormulaError
from utils.run_with_timeout import run_with_timeout, TimeoutException

class Z3Solver(Solver):
    def __init__(self, timeout: int):
        self.solver = z3.Solver()
        self.solver.set(auto_config=False)
        self.timeout = timeout
        self.solver.set('timeout', self.timeout)

    def check(self, formula: str) -> SatStatus:
        self.solver.reset()
        try:
            decl = z3.parse_smt2_string(formula)
        except z3.Z3Exception:
            raise InvalidFormulaError(formula)
        
        self.solver.add(decl)
        try:
            res = run_with_timeout(self.solver.check, timeout=self.timeout)
        except TimeoutException:
            return SatStatus.UNKNOWN
        
        if res == z3.sat:
            return SatStatus.SAT
        elif res == z3.unsat:
            return SatStatus.UNSAT
        else:
            return SatStatus.UNKNOWN

    def get_assignments(self) -> dict[str,str]:
        model = self.solver.model()
        assignments = {}
        for decl in model:
            if decl.arity() > 0:
                continue
            assignments[str(decl)] = str(model[decl])
        return assignments
