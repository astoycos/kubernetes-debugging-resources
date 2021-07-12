

#oc -n test-network-policy exec webserver-pod-test -- curl -s -I -m 2 10.96.23.185:8080
while true 
do 
   oc -n test-network-policy exec webserver-79997dfc5d-6j7qx -- curl -s -I -m 2 10.96.95.184:8080
   sleep 1
done


exit
for pod in $(oc get pods -n test-network-policy -o name); do 
	echo " " 
	echo "${pod} IP --> $(kubectl get ${pod} -n test-network-policy -o=jsonpath={.status.podIP})"
	echo "CURLing from above Pod with command --> curl -s -I -m 2 10.96.23.185:8080" 
	oc -n test-network-policy exec $pod -- curl -s -I -m 2 10.96.23.185:8080; 
done
