for pod in $(oc get pods -n test-network-policy -o name); do 
	echo " " 
	echo "${pod} IP --> $(kubectl get ${pod} -n test-network-policy -o=jsonpath={.status.podIP})"
	echo "CURLing from above Pod with command --> curl -s -I -m 2 webserver:8080" 
	oc -n test-network-policy exec $pod -- curl -s -I -m 2 webserver:8080; 
done
