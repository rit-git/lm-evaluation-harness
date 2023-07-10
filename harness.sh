#!/bin/bash

MODEL=$1
MODEL_ARGS="pretrained=$MODEL"
if [ $# -ge 2 ]; then
  DATASET=$2
else
  DATASET="jcommonsenseqa"
fi
if [ $# -ge 3 ]; then
  TEMPLATE=$3
else
  TEMPLATE=0.2
fi
if [ $# -ge 4 ]; then
  LIMIT=$4
else
  LIMIT=0.1
fi
TASK="$DATASET-1.1-$TEMPLATE"

echo "python main.py \
    --model hf-causal \
    --model_args $MODEL_ARGS \
    --tasks $TASK \
    --num_fewshot "3" \
    --device "cuda" \
    --limit $LIMIT \
    --output_path "${MODEL//\//--}-$TASK.json""