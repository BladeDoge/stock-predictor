#Set python base image
FROM python:3.8 

#Set working directory to root of projects
WORKDIR . 

#Install dependencies
RUN apt-get -y update  && apt-get install -y \
    python3-dev \
    apt-utils \
    python-dev \
    build-essential \   
&& rm -rf /var/lib/apt/lists/* 

#Install pip,cython,numpy, and pystan. Order matters!
RUN pip install --no-cache-dir -U pip
RUN pip install --no-cache-dir -U cython
RUN pip install --no-cache-dir -U numpy
RUN pip install --no-cache-dir -U pystan

#Copy and install requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -U -r  requirements.txt

#Copy src code to root to make Docker cache more efficient and optimize continer image build times
COPY src/ .

#Expose port 8000
EXPOSE 8000

#Run uvicorn server
CMD ["uvicorn","main:app","--reload","workers 1","--host 0.0.0.0","--port 8000"]
