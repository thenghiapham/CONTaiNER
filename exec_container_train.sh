export SAVED_MODEL_DIR="../models/container_10"
export OUTPUT_DIR="../output/container_10"
export finetune_loss=KL
export is_viterbi=viterbi

python src/container.py --data_dir ../ontonotes --labels-train ../ontonotes/labels_train.txt --labels-test ../ontonotes/labels_test.txt --config_name bert-base-uncased --model_name_or_path bert-base-uncased --saved_model_dir ${SAVED_MODEL_DIR} --output_dir ${OUTPUT_DIR} --support_path val_10 --test_path test --n_shots 10 --max_seq_length 128 --embedding_dimension 128 --num_train_epochs 1 --train_batch_size 32 --seed 1 --do_predict --select_gpu 0 --training_loss KL --finetune_loss ${finetune_loss} --evaluation_criteria euclidean_hidden_state --learning_rate 5e-5 --learning_rate_finetuning 5e-5 --consider_mutual_O --temp_trans 0.01 --silent --do_train
