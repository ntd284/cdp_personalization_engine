# Use the official Ubuntu image as a base
FROM ubuntu:20.04

# Set environment variables to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install Python and necessary dependencies
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-dev build-essential && \
    apt-get clean

# Install Uvicorn and FastAPI (or your chosen framework)
RUN pip3 install --upgrade pip && \
    pip3 install uvicorn fastapi

# Add Python's binary directory to PATH explicitly
ENV PATH="/usr/local/bin:/usr/bin:/bin:$PATH"

# Set the working directory
WORKDIR /src

# Copy the requirements file to the container
COPY ./src /src

# Install dependencies from the requirements file
RUN pip3 install -r /src/requirements.txt

# Copy the application code into the container

# Expose the port where the app will be served
EXPOSE 8000

# Command to run the app using Uvicorn
# CMD ["python3", "./src/api_start.py"]
