#!/bin/bash


for pod in $(oc get pods -n test-network-policy -o name); do 
   echo "Testing POD:$pod with service" 
   oc -n test-network-policy exec $pod -- curl --local-port 8081 -s -I -m 2 webserver:8080 

done



for pod in $(oc get pods -n test-network-policy -o name); do
   echo "Testing POD: $pod with route" 
   oc -n test-network-policy exec $pod -- curl -s -I -m 2  -k https://webserver-test-network-policy.apps.npd.dc1.cloud.safran
done

