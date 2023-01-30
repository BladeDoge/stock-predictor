# stock-predictor
A stock prediction model as a RESTful API using FastAPI to AWS EC2.
Currently supports 3 stock tickers 'AAPL','GOOG', and 'MSFT'.

## Instantiate server on AWS EC2
### Set up environment as below

```
sudo yum update -y 
sudo yum install git -y  # install git

# install tmux to switch easily between programs in one terminal
sudo yum install tmux

# install miniconda and add its path to env
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p ~/miniconda
echo "PATH=$PATH:$HOME/miniconda/bin" >> ~/.bashrc
source ~/.bashrc
```
### Clone the repository
Since the environment is set up, now clone the repository

```
git clone https://github.com/BladeDoge/stock-predictor.git
cd stock-predictor
pip install -U pip
pip install -r requirements.txt
```

### Launch server app
Before launching the app, we can avoid ssh time out using tmux to create a new session.

```
tmux new -s stock_session
```

Next, navigate to /src folder and run the following command:

``` 
uvicorn main:app --reload --workers 1 --host 0.0.0.0 --port 8000
```
The shell should look like this:

```
[ec2-user@ip-172-31-24-66 src]$ uvicorn main:app --reload --workers 1 --host 0.0.0.0 --port 8000                                                  
INFO:     Will watch for changes in these directories: ['/home/ec2-user/stock-predictor/src']
INFO:     Uvicorn running on http://0.0.0.0:8000 (Press CTRL+C to quit)
INFO:     Started reloader process [9693] using StatReload
INFO:     Started server process [9695]
INFO:     Waiting for application startup.
INFO:     Application startup complete.
```

The server is now running. Clients can now hit the server API endpoint. 

## Use stock predicter as a client
Open a terminal on your local machine and use the below curl calls to hit the server API endpoint.

### MSFT

```
curl \
--header "Content-Type: application/json" \
--request POST \
--data '{"ticker":"MSFT", "days":7}' \
http://54.208.64.249:8000/predict
```

### AAPL

```
curl \
--header "Content-Type: application/json" \
--request POST \
--data '{"ticker":"AAPL", "days":7}' \
http://54.208.64.249:8000/predict
```

### GOOG

```
curl \
--header "Content-Type: application/json" \
--request POST \
--data '{"ticker":"GOOG", "days":7}' \
http://54.208.64.249:8000/predict
```
# Documentation Resources
If you wish to access the API documentation, go to the following link:

```
http://54.208.64.249:8000/docs
```

