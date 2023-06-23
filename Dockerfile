# Start from a core stack version
FROM python:3.9-slim-buster

# Ensure that Python outputs everything that's printed inside
# the application rather than buffering it.
ENV PYTHONUNBUFFERED 1

# Upgrade pip
RUN pip install --upgrade pip

# Install build dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libffi-dev \
    libssl-dev \
    libjpeg-dev \
    zlib1g-dev \
    libpng-dev

# Copy requirements.txt to the Docker image and install packages
COPY requirements.txt /
RUN pip install -r /requirements.txt --no-cache-dir

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app/

# Expose the port uWSGI will listen on
EXPOSE 8000

# Disable TensorFlow and TensorRT library warnings
ENV TF_CPP_MIN_LOG_LEVEL 2

# Finally, run Uvicorn!
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
