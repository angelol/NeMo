#!/usr/bin/bash
models=(
  QuartzNet15x5Base-En
  stt_en_jasper10x5dr
  stt_en_citrinet_256
  stt_en_citrinet_512
  stt_en_citrinet_1024
  stt_en_citrinet_256_gamma_0_25
  stt_en_citrinet_512_gamma_0_25
  stt_en_citrinet_1024_gamma_0_25
  stt_en_conformer_ctc_small
  stt_en_conformer_ctc_medium
  stt_en_conformer_ctc_large
  stt_en_conformer_ctc_small_ls
  stt_en_conformer_ctc_medium_ls
  stt_en_conformer_ctc_large_ls
)

for model_checkpoint in "${models[@]}"; do
  python transcribe_speech.py pretrained_name="${model_checkpoint}" \
    audio_dir="${audio_dir}" \
    output_filename="${output_dir}/${model_checkpoint}"
done