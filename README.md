# Named Entity Recognition (NER) API

This project provides an API for performing Named Entity Recognition (NER) on text using a pre-trained NER model.

## Introduction

Named Entity Recognition (NER) is a subtask of information extraction that locates and classifies named entities mentioned in unstructured text into predefined categories such as person names, organizations, locations, medical codes, time expressions, quantities, monetary values, percentages, etc.

The API uses the [DSLIM BERT-based NER](https://huggingface.co/dslim/bert-base-NER) model, which is based on the BERT architecture and fine-tuned on the CoNLL-2003 NER dataset.

## Installation

To run the NER API locally, you need to have Docker installed. Follow these steps to get started:

1. Clone the repository:

git clone https://github.com/halimhamidov/ner-api.git


2. Build the Docker image:

docker build -t ner-api -f Dockerfile .


3. Run the Docker container:

docker run -p 8000:8000 ner-api


The API will be accessible at [http://localhost:8000](http://localhost:8000).

## API Usage

### Extract Entities

**Endpoint:** `/entities`

**Method:** POST

**Request Body:**

```json
{
"text": "Apple Inc. is a technology company headquartered in Cupertino, California."
}
```
Response Body:

```
{
  "entities": [
    {
      "word": "Apple",
      "score": 0.9995644688606262,
      "entity": "I-ORG",
      "index": 1,
      "start": 0,
      "end": 5
    },
    {
      "word": "Inc",
      "score": 0.9994686841964722,
      "entity": "I-ORG",
      "index": 2,
      "start": 6,
      "end": 9
    },
    {
      "word": "Cupertino",
      "score": 0.994751513004303,
      "entity": "I-LOC",
      "index": 10,
      "start": 52,
      "end": 61
    },
    {
      "word": "California",
      "score": 0.9977561831474304,
      "entity": "I-LOC",
      "index": 14,
      "start": 63,
      "end": 73
    }
  ]
}
```
Contributing
Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

License
This project is licensed under the MIT License.

Contact
For any questions or inquiries, please contact apearl@student.42.fr


