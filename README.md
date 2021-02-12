# ReJOIN

A Tune-exp for ReJOIN

## Some experiments
- https://drive.google.com/open?id=1bOBtplkxfGXGRWmib4WYMotjJ47fGz2C


## Some Running examples

- Train target group 4 for 200 episodes
`sudo python3 main.py -e 200 -g 1 -tg 4 -se 100 -s ./saved_model/group4-200/`

Now the plots are in ./outputs folder (default) and the model in  ./saved_model/ 

- Restore saved model and test group 4 
`sudo python3 main.py -e 3 -g 1 -tg 4 -r ./saved_model/group4-200/ --testing -o ./outputs/testing/`


- Restore saved model and keep training on group 5 for 500 episodes
`sudo python3 main.py -e 200 -g 1 -tg 5 -se 100 -r ./saved_model/group4-200/ -s ./saved_model/group5-500/`

- Execute a single query `python main.py --query 3a --episodes 150`

## Program parameters

- Agent configuration file  
    "-a", "--agent-config"  
    default="config/ppo.json"  

- Network specification file  
    "-n", "--network-spec"  
    default="config/complex-network.json"  

- Number of episodes  
    "-e", "--episodes"  
    default=800  

- Total groups of different number of relations  
    "-g", "--groups"  
    default=1  

- Run specific group  
    "-tg", "--target_group"  
    default=5  

- Incremental Mode  
    "-m", "--mode"  
    default="round"  

- Maximum number of timesteps per episode  
    "-ti", "--max-timesteps"  
    default=20  

- Run specific query  
    "-q", "--query"  
     default=""  

- Save agent to this dir  
    "-s", "--save_agent"  

- Restore Agent from this dir  
    "-r", "--restore_agent"  

- Test agent without learning (use deterministic) 
    "-t", "--testing"  
    action="store_true"  
    default=False  

- Order queries by relations_num  
    "-all", "--run_all"  
    default=False  

- Save agent every x episodes  
    "-se", "--save-episodes"  
    default=100  

- Select phase (1 or 2)  
    "-p", "--phase"  
    default=1  
    
