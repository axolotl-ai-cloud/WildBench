MODE=$1

# Score only 
python leaderboard/data_dir/_create_tables.py score
FOLDER="leaderboard/data_dir"
margin=3;tie_margin=1;K=4;dynamic=True;
python -m leaderboard.wb_elo --loo -1 --K $K --margin $margin --tie_margin $tie_margin --num_rounds 100 --dynamic $dynamic

# if MODE is not score 
if [ "$MODE" != "score_only" ];
then 
    python leaderboard/data_dir/_create_tables.py pairwise-gpt4t -1
    python leaderboard/data_dir/_create_tables.py pairwise-llama -1
    python leaderboard/data_dir/_create_tables.py pairwise-haiku -1

    python leaderboard/data_dir/_create_tables.py pairwise-gpt4t 500
    python leaderboard/data_dir/_create_tables.py pairwise-llama 500
    python leaderboard/data_dir/_create_tables.py pairwise-haiku 500

    python leaderboard/data_dir/_create_tables.py pairwise-gpt4t 1000
    python leaderboard/data_dir/_create_tables.py pairwise-llama 1000
    python leaderboard/data_dir/_create_tables.py pairwise-haiku 1000

    python leaderboard/data_dir/_create_tables.py pairwise-gpt4t 1500
    python leaderboard/data_dir/_create_tables.py pairwise-llama 1500
    python leaderboard/data_dir/_create_tables.py pairwise-haiku 1500
fi 

python leaderboard/data_dir/_merge_results.py
python leaderboard/show_table.py