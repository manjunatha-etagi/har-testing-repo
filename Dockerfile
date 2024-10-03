# Step 1: Use a base image (Ubuntu)
FROM ubuntu:20.04 as base

# Step 2: Install some basic utilities (creates one layer)
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    build-essential \
    unzip \
    python3-pip

# Step 3: Add large binary files (these will make the image large)
COPY largefile1.zip /app/largefile1.zip
COPY largefile2.zip /app/largefile2.zip
COPY largefile3.zip /app/largefile3.zip

# Step 4: Unzip the large files and clean up zip files
RUN unzip /app/largefile1.zip -d /app/ && \
    unzip /app/largefile2.zip -d /app/ && \
    unzip /app/largefile3.zip -d /app/ && \
    rm /app/*.zip

# Step 5: Install Python requirements
COPY requirements.txt /app/requirements.txt
RUN pip3 install -r /app/requirements.txt

# Step 6: Add source code
COPY src/ /app/src/

# Step 7: Run the application (just an example Python app)
CMD ["python3", "/app/src/app.py"]
