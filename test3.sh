for pod in $(oc get pods -o name); do 
	echo " " 
	echo "${pod} IP --> $(kubectl get ${pod} -o=jsonpath={.status.podIP})"
	echo "CURLing from above Pod with command --> curl -s -I -m 2 webserver:8080" 
	oc exec $pod -- curl -s -I -m 2 webserver:8080; 
done
