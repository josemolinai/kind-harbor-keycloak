#!/bin/bash
helm uninstall -n harbor harbor
kubectl -n harbor delete secret harbor-tls