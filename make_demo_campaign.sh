#!/bin/bash

token=`curl --data "username=ek@test.ode&password=password" localhost:7231/data.ode.org/v1/authentication/authenticate | tr -d '"}' | cut -c 8-`;

curl 'http://localhost:7231/data.ode.org/v1/annotation-campaign/new' -H "Authorization: Bearer $token" -H 'Content-Type: application/json' --data '{"name":"Demo September SPM","desc":"Campagne pour la demo du 27 Septembre","datasets":[4],"start":"2018-09-01","end":"2018-12-01","annotation_set":2,"annotators":[2,3,4],"annotation_goal":2,"annotation_method":0}';

curl 'http://localhost:7231/data.ode.org/v1/annotation-campaign/new' -H "Authorization: Bearer $token" -H 'Content-Type: application/json' --data '{"name":"Demo September Whales","desc":"Campagne pour la demo du 27 Septembre","datasets":[5],"start":"2018-09-01","end":"2018-12-01","annotation_set":1,"annotators":[2,3,4],"annotation_goal":2,"annotation_method":0}';
