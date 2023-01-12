#!/bin/bash

kubectl -n rstudio delete pod --field-selector=status.phase==Succeeded
