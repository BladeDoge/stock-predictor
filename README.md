# stock-predictor
A stock prediction model as a RESTful API using FastAPI to AWS EC2.
Currently supports 3 stock tickers 'AAPL','GOOG', and 'MSFT'.

## Instantiate server locally
Pull down repository, navigate to /src folder and run the following command:

``` 
uvicorn main:app --reload --workers 1 --host 0.0.0.0 --port 8000
```

Then once server is running, open another terminal and use the below curl calls to hit the API endpoint.

## MSFT

```
curl \
--header "Content-Type: application/json" \
--request POST \
--data '{"ticker":"MSFT", "days":7}' \
http://0.0.0.0:8000/predict
```

## AAPL

```
curl \
--header "Content-Type: application/json" \
--request POST \
--data '{"ticker":"AAPL", "days":7}' \
http://0.0.0.0:8000/predict
```

## GOOG

```
curl \
--header "Content-Type: application/json" \
--request POST \
--data '{"ticker":"GOOG", "days":7}' \
http://0.0.0.0:8000/predict
```


