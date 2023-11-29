    docker build -t khaledkhaled/multi-client:latest  -t khaledkhaled/multi-client:$SHA   -f ./client/Dockerfile  ./client
    docker build -t khaledkhaled/multi-server:latest  -t khaledkhaled/multi-serve:$SHA  -f ./server/Dockerfile   ./server
    docker build -t khaledkhaled/multi-worker:latest  -f khaledkhaled/multi-worker:$SHA    ./worker/Dockerfile       ./worker




    docker push khaledkhaled/multi-client:latest 
 
    docker push khaledkhaled/multi-server:latest 
    docker push khaledkhaled/multi-worker:latest



    docker push khaledkhaled/multi-client:$SHA 
 
    docker push khaledkhaled/multi-server:$SHA 
    docker push khaledkhaled/multi-worker:$SHA



    kubectl appl - k8s

    kubectl set image deployments/server-deployment  server=khaledkhaled/multi-server:$SHA  

    kubectl set image deployments/client-deployment  client=khaledkhaled/multi-client:$SHA 


    kubectl set image deployments/worker-deployment  worker=khaledkhaled/multi-worker:$SHA  
 