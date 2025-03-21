from abc import ABC, abstractmethod

class BMC(ABC):
    @abstractmethod
    def verify(self, code: str) -> bool:
        pass