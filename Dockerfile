FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-dev build-essential && \
    apt-get clean

RUN pip3 install --upgrade pip && \
    pip3 install uvicorn fastapi

WORKDIR /src
COPY src/requirements.txt /src/requirements.txt
RUN pip3 install -r /src/requirements.txt || true

EXPOSE 8000

CMD ["python3", "api_start.py"]
