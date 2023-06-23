
resources to learn:
https://huggingface.co/dslim/bert-base-NER

https://www.freecodecamp.org/news/intro-to-generative-ai-10-free-courses-by-google/


docker build -t my_project -f Dockerfile .

docker run -p 8000:8000 my_project  

bess-f1r3s2% docker build -t my_project -f Dockerfile .

[+] Building 7.7s (12/12) FINISHED                                                                                
 => [internal] load build definition from Dockerfile                                                         0.5s
 => => transferring dockerfile: 941B                                                                         0.0s
 => [internal] load .dockerignore                                                                            0.4s
 => => transferring context: 2B                                                                              0.1s
 => [internal] load metadata for docker.io/library/python:3.9-slim-buster                                    1.3s
 => [internal] load build context                                                                            0.1s
 => => transferring context: 1.30kB                                                                          0.0s
 => [1/7] FROM docker.io/library/python:3.9-slim-buster@sha256:320a7a4250aba4249f458872adecf92eea88dc6abd2d  0.0s
 => CACHED [2/7] RUN pip install --upgrade pip                                                               0.0s
 => CACHED [3/7] RUN apt-get update && apt-get install -y     build-essential     libffi-dev     libssl-dev  0.0s
 => CACHED [4/7] COPY requirements.txt /                                                                     0.0s
 => CACHED [5/7] RUN pip install -r /requirements.txt --no-cache-dir                                         0.0s
 => CACHED [6/7] WORKDIR /app                                                                                0.0s
 => [7/7] COPY . /app/                                                                                       0.8s
 => exporting to image                                                                                       3.3s
 => => exporting layers                                                                                      3.1s
 => => writing image sha256:931ca51cea6fc3fd24f809827fbb6ff12d593894f10d5699316b80899d60e780                 0.1s
 => => naming to docker.io/library/my_project                                                                0.1s
bess-f1r3s2% docker run -p 8000:8000 my_project        
Downloading: 100%|██████████| 829/829 [00:00<00:00, 3.36MB/s]
Downloading: 100%|██████████| 433M/433M [00:10<00:00, 43.2MB/s] 
Downloading: 100%|██████████| 59.0/59.0 [00:00<00:00, 263kB/s]
Downloading: 213kB [00:00, 1.32MB/s]
Downloading: 100%|██████████| 2.00/2.00 [00:00<00:00, 8.45kB/s]
Downloading: 100%|██████████| 112/112 [00:00<00:00, 476kB/s]
INFO:     Started server process [1]
INFO:     Waiting for application startup.
INFO:     Application startup complete.
INFO:     Uvicorn running on http://0.0.0.0:8000 (Press CTRL+C to quit)
INFO:     172.17.0.1:48302 - "GET / HTTP/1.1" 200 OK
INFO:     172.17.0.1:48316 - "POST / HTTP/1.1" 200 OK
INFO:     172.17.0.1:59982 - "POST / HTTP/1.1" 200 OK
INFO:     172.17.0.1:41282 - "POST / HTTP/1.1" 200 OK
INFO:     172.17.0.1:41282 - "GET / HTTP/1.1" 200 OK
INFO:     172.17.0.1:41284 - "POST / HTTP/1.1" 200 OK

let's put the text "Apple Inc. is a technology company headquartered in Cupertino, California."
into the input form.

or "My name is Clara and I live in Berkeley, California."


Named Entity Recognition (NER) is a subtask of information extraction that locates and classifies named entities mentioned in unstructured text into predefined categories such as person names, organizations, locations, medical codes, time expressions, quantities, monetary values, percentages, etc.

This is particularly useful in several areas of natural language processing (NLP) and data mining, such as:

Information Extraction: NER is used to identify key information from text data for further processing. For example, a company might want to analyze customer feedback by extracting product or feature names.

Question Answering: In order to answer questions about a piece of text, a system must be able to understand the entities that the text is about.

Content Recommendation: Named entities in a text can be used to provide more precise recommendations. For example, if a news article mentions "Apple Inc.", it might be interesting to someone who has read other articles about this company.

Chatbots and Virtual Assistants: These systems can use NER to understand the subjects and objects of a user's commands or queries, enabling them to provide more accurate responses.

Knowledge Graph Construction: Named entities and their relations can be used to construct knowledge graphs, which are structured representations of the facts in a text.

Sentiment Analysis: By identifying entities, a system can assess sentiments towards specific products, people or organizations, rather than trying to assess the sentiment of the whole text.

As for the model, it takes a piece of unstructured text as input and outputs structured data consisting of entities that belong to predefined categories. This process typically involves text tokenization, feature extraction, and a classification algorithm. The specific method varies depending on the particular NER model used. For instance, some NER models use Conditional Random Fields (CRF), others use Bi-LSTM (Bidirectional Long Short-Term Memory) networks, and recent state-of-the-art models employ Transformer architectures like BERT, as we used in our model.


