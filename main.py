from fastapi import FastAPI, Form, Response
from fastapi.responses import HTMLResponse
from pydantic import BaseModel
from transformers import pipeline

class Entity(BaseModel):
    word: str
    score: float
    entity: str
    index: int
    start: int
    end: int

class TextOut(BaseModel):
    entities: list[Entity]

app = FastAPI()

nlp_model = pipeline('ner', model='dslim/bert-base-NER', tokenizer='dslim/bert-base-NER')

@app.get("/", response_class=HTMLResponse)
async def read_form():
    content = """
<body>
<form action="/" method="post">
<input type="text" maxlength="500" name="text" size="50">
<input type="submit">
</form>
</body>
    """
    return content

@app.post("/")
async def extract_entities(text: str = Form(...)):
    result = nlp_model(text)
    entities = [Entity(**r) for r in result]
    return TextOut(entities=entities)
