#!/bin/bash
for n in `cat ip.txt`; do host $n; done
