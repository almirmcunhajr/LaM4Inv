from enum import Enum

from openai import OpenAI as OpenAIClient

from llm.llm import LLM

class OpenAIModel(Enum):
    GPT_3_5_TURBO = "gpt-3.5-turbo"
    GPT_4 = "gpt-4"
    GPT_4_TURBO = "gpt-4-turbo"
    GPT_4O = "gpt-4o"
    GPT_4O_MINI = "gpt-4o-mini"

class OpenAI(LLM):
    def __init__(self, model: OpenAIModel, api_key: str = None, system_instructions: str = None, base_url: str = None):
        self.model = model
        self.client = self._get_openai_client(api_key, model, base_url)
        self.messages = []
        if system_instructions:
            self._add_system_instructions(system_instructions)
    
    def _get_openai_client(self, api_key: str, base_url: str) -> OpenAIClient:
        return OpenAIClient(
            api_key=api_key,
            base_url=base_url
        )
    
    def _get_messages(self) -> list:
        return self.messages
    
    def _add_system_instructions(self, instructions: str):
        self.messages.append({"role": "developer", "content": instructions})
    
    def _add_assistant_response(self, response: str):
        self.messages.append({"role": "assistant", "content": response})

    def _add_user_message(self, message: str):
        self.messages.append({"role": "user", "content": message})
    
    def clear(self):
        self.messages = []

    def chat(self, message: str) -> str:
        self._add_user_message(message)

        completions = self.client.chat.completions.create(
            model=self.model.value,
            messages=self._get_messages(),
        )
        
        response = completions.choices[0].message.content

        self._add_assistant_response(response)

        return response
