# ReJOIN

A Tune-exp for ReJOIN


## Pre-requieste
use venv in pycharm or use anaconda

### library dependencis:
psycopg2: 
a> excute: sudo apt install python3-dev libpq-dev
b> excute: pip install psycopg2

or:
install binary version

### libraries alternative settings:
numpy

psycopg2-binary

moz_sql_parser

tensorflow-gpu==1.14.0

tensorforce==0.4.3

matplotlib

Python=3.6

### postgres

1> download postgres into ubuntu system follow this: https://www.postgresql.org/download/linux/ubuntu/

2> access to https://dev.to/ohaleks/set-up-wsl2-postgresql-and-phoenix-liveview-on-windows-3ol5
    
    a> sudo service postgresql status   //to check status
    
    b> sudo service postgresql start    // start server
    
    c> sudo service postgresql status   //double check status is 'online' now

### download join order benchmark, datbase part

1>  git clone https://github.com/gregrahn/join-order-benchmark.git to your local ubuntu system

2>  access to https://github.com/gregrahn/join-order-benchmark/tree/e6d4aba307a0f8849b681ccbd2ca04381d3d1731 to follow section 'Step-by-step instructions'
    
    a> do 1>download *gz files
    
    b> skip 2>, directly go to https://github.com/alberanid/imdbpy, follow 'Installation' section
    
    c> before 3>, create a postgres account, follow https://dev.to/ohaleks/set-up-wsl2-postgresql-and-phoenix-liveview-on-windows-3ol5, use: sudo -u postgres createuser <your_username>
    (ps: need to lift the access ability, can be done later, use postgres: sudo -u postgres createdb imdbload)
    
    d> before 4>, go to https://dev.to/ohaleks/set-up-wsl2-postgresql-and-phoenix-liveview-on-windows-3ol5, 
        follow from: sudo -u postgres psql.
        after give privileges, use \l to make sure imdbload is there.
    
    e 4> python3 imdbpy2sql.py -d PATH_TO_GZ_FILES -u postgres://username:password@hostname/imdbload
        ps:
            1>here change PATH_TO_GZ_FILES to the absolute path of your downloaded gz files
            2>change username and password to your own 
            3>change hostname to 'localhost'
        wait for processing...................(take a while)

from here, download join order benchmark database part is finished. 

### download join order benchmark, query part

1> go to https://github.com/gregrahn/join-order-benchmark/tree/e6d4aba307a0f8849b681ccbd2ca04381d3d1731
    
    a> use 'sudo -u postgres psql' to start cli
    
    b> in postgres, switch to imdbload: \c imdbload
    
    c> use \dt to make sure you have datasets in it.
    
    d> open schema.sql, copy and paste to excute the sql sentences in postgres(your linux)
    
    e> open fkindexes.sql, excute the sql sentences in postgres










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
