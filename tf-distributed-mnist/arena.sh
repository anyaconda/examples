#!/bin/bash

wandb arena submit tf --name=exp1 \
    --wandb-project=distributed-mnist \
    --gpus=1 \
    --workers=2 \
    --workerImage=ufoym/deepo:keras \
    --syncMode=git \
    --syncSource=https://github.com/wandb/examples.git \
    --ps=1 \
    --psImage=ufoym/deepo:keras-cpu \
    --logdir=gs://wandb-production_cloudbuild/rad \
    --tensorboard \
    "pip install wandb pillow && python code/examples/tf-distributed-mnist/train.py --logdir gs://wandb-production_cloudbuild/rad"