
## Traffic Analysis
Start mitm proxy using reverse proxy mode, listening on port 8082.  With the api service running on port 8080 we will then 
record any interactions to the sessiondata.dat file.
```bash
mitmdump -p 8082 --mode reverse:http://localhost:8080/ -w sessiondata.dat
```
