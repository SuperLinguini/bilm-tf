for i in {0..25}
do
	echo "Epoch $i" |& tee -a compare.log
	if [ $i -eq 0 ]
	then
		python -u bin/word.py --train_prefix='/home/ubuntu/bilm-tf/wikitext-2/wiki.train.tokens' --vocab_file /home/ubuntu/bilm-tf/vocab.txt --save_dir /home/ubuntu/bilm-tf/compare |& tee -a compare.log
	else
		python -u bin/word.py --train_prefix='/home/ubuntu/bilm-tf/wikitext-2/wiki.train.tokens' --vocab_file /home/ubuntu/bilm-tf/vocab.txt --save_dir /home/ubuntu/bilm-tf/compare --load_latest |& tee -a compare.log
	fi
	python -u bin/run_test.py --test_prefix='/home/ubuntu/bilm-tf/test_files/wiki.valid.tokens' --vocab_file='/home/ubuntu/bilm-tf/vocab.txt' --save_dir='/home/ubuntu/bilm-tf/compare' |& tee -a compare.log
	python -u bin/run_test.py --test_prefix='/home/ubuntu/bilm-tf/test_files/wiki.test.tokens' --vocab_file='/home/ubuntu/bilm-tf/vocab.txt' --save_dir='/home/ubuntu/bilm-tf/compare' |& tee -a compare.log
done
