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
  NUM_FEWSHOT=$5
else
  NUM_FEWSHOT=3
fi
if [ $# -ge 5 ]; then
  LIMIT=$5
else
  LIMIT=0.2
fi
TASK="$DATASET-1.1-$TEMPLATE"

python main.py \
    --model hf-causal \
    --model_args $MODEL_ARGS \
    --tasks $TASK \
    --num_fewshot $NUM_FEWSHOT \
    --device "cuda" \
    --limit $LIMIT \
    --output_path "${MODEL//\//--}-$TASK.json"
