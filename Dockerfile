FROM python:3.12-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY ./requirements.txt .

RUN pip install -r requirements.txt --no-cache

COPY . .

CMD ["python", "wsgi.py"]
