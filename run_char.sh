for i in {0..25}
do
	echo "Epoch $i" |& tee -a compare.log
	if [ $i -eq 0 ]
	then
		python -u bin/char.py --train_prefix='/home/ubuntu/bilm-tf/wikitext-2/wiki.train.tokens' --vocab_file /home/ubuntu/bilm-tf/vocab.txt --save_dir /home/ubuntu/bilm-tf/compare_char |& tee -a compare_char.log
	else
		python -u bin/char.py --train_prefix='/home/ubuntu/bilm-tf/wikitext-2/wiki.train.tokens' --vocab_file /home/ubuntu/bilm-tf/vocab.txt --save_dir /home/ubuntu/bilm-tf/compare_char --load_latest |& tee -a compare_char.log
	fi
	python -u bin/run_test.py --test_prefix='/home/ubuntu/bilm-tf/test_files/wiki.valid.tokens' --vocab_file='/home/ubuntu/bilm-tf/vocab.txt' --save_dir='/home/ubuntu/bilm-tf/compare_char' |& tee -a compare_char.log
	python -u bin/run_test.py --test_prefix='/home/ubuntu/bilm-tf/test_files/wiki.test.tokens' --vocab_file='/home/ubuntu/bilm-tf/vocab.txt' --save_dir='/home/ubuntu/bilm-tf/compare_char' |& tee -a compare_char.log
done
