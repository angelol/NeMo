WANDB_API_KEY="$1"

read -r -d '' command << EOF
set -e -x
mkdir /result/nemo_experiments
cd NeMo
git pull
bash reinstall.sh
cd examples/nlp/machine_translation
wandb login ${WANDB_API_KEY}
sleep 200000
set +e +x
EOF

ngc batch run \
  --instance dgx1v.16g.1.norm \
  --name "ml-model.aayn tips_simple" \
  --image "nvcr.io/nvidian/ac-aiapps/speech_translation:latest" \
  --result /result \
  --datasetid 90462:/data \
  --commandline "${command}"