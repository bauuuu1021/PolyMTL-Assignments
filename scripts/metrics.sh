#/bin/bash

if [[ $# -ne 2 ]] ; then
    echo 'Arg: [metric name] [Average/Sum/Maximum/Minimum]'
    exit 1
fi

startT=$(date --iso-8601=seconds -u)
source venv_evaluate/bin/activate
python3 evaluate.py
deactivate
endT=$(date --iso-8601=seconds -u)

aws cloudwatch get-metric-statistics --namespace AWS/ApplicationELB --metric-name $1 --statistics $2 --period 1 --dimensions Name=LoadBalancer,Value=app/TP1/382a875a12350efe Name=TargetGroup,Value=targetgroup/cluster1/95be6976f886b7b0 --start-time $startT --end-time $endT

aws cloudwatch get-metric-statistics --namespace AWS/ApplicationELB --metric-name $1 --statistics $2 --period 1 --dimensions Name=LoadBalancer,Value=app/TP1/382a875a12350efe Name=TargetGroup,Value=targetgroup/cluster2/12d870f99353de8c --start-time $startT --end-time $endT

echo '----------------------------------------'
echo 'start:' $startT
echo 'end:  ' $endT
