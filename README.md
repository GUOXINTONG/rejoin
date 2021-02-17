# rejoin

AI Engine lab experiment for  paper [Deep Reinforcement Learning for Join Order Enumeration](https://www.cs.brandeis.edu/~olga/publications/ReJOIN_aiDM18.pdf)


## Pre-requieste

### Pycharm set up

- download pycharm free version on official website.
  
- wsl2 are not fully support GUI, but we can follow this article to set up a usable version:
[gui set up](https://medium.com/@japheth.yates/the-complete-wsl2-gui-setup-2582828f4577#id_token=eyJhbGciOiJSUzI1NiIsImtpZCI6ImZkMjg1ZWQ0ZmViY2IxYWVhZmU3ODA0NjJiYzU2OWQyMzhjNTA2ZDkiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJuYmYiOjE2MTI5OTM5MDAsImF1ZCI6IjIxNjI5NjAzNTgzNC1rMWs2cWUwNjBzMnRwMmEyamFtNGxqZGNtczAwc3R0Zy5hcHBzLmdvb2dsZXVzZXJjb250ZW50LmNvbSIsInN1YiI6IjEwMTc3NjAzNzgyOTUwMDE2MDE1NiIsImVtYWlsIjoidGVycnlndW8wNjE2QGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJhenAiOiIyMTYyOTYwMzU4MzQtazFrNnFlMDYwczJ0cDJhMmphbTRsamRjbXMwMHN0dGcuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJuYW1lIjoiVGVycnkgR3VvIiwicGljdHVyZSI6Imh0dHBzOi8vbGgzLmdvb2dsZXVzZXJjb250ZW50LmNvbS9hLS9BT2gxNEdqNVVwWkRUSTdPVDJfcWsxT1FFbkpLdlEtTHQ1OXJ1R0htMWtOUy1BPXM5Ni1jIiwiZ2l2ZW5fbmFtZSI6IlRlcnJ5IiwiZmFtaWx5X25hbWUiOiJHdW8iLCJpYXQiOjE2MTI5OTQyMDAsImV4cCI6MTYxMjk5NzgwMCwianRpIjoiMzQzNjliYjgxMjRjYWY1ZDY5ZjU3MmZiMmVjMzkxNjQ4MWVjMzUwZCJ9.wNwXNkZ9QD3sweZt4hCzzcXA97Zd2k-DAog7hNe0hbd_XtwfaaHy6IoTOGLYI1i6Lti31QNLu7wZVBAxlZap06ETkaRjg8Esm0HgqSTPOHxbnqyq0JVE05HLAAUQmvbgDXaXwnAuR1YTa8ylxRjbvKoDRp3PtJ1x3j8RZZE6CIpgWoxP-H5UfE8ms3kTLlWlFzh6mg6ujnCOVldpzIxiod2Gi2kp0w-Vz1MFeITu2WQWZHgkzrW-icIsAVBcBnzl6h-IJPKCpo3JqxMJ9LE_lx-in9IFrRLehrWf_J96g6xZYIMpZR1B_ZEs9ei-Cg7C3fPZg-QKLTG__kS-zIt1fA)

- once you can luanch X-server, you are able to excute pycharm.sh to open the IDE in your ubuntu server
    

After pycharm being successfully set up, you can git clone this repo to your local.(use venv in pycharm or use anaconda, for the project environment)
(ps: feel free to use Pycharm in Windows as alternative)

## ***Library dependencis attention:***

    numpy
    
    psycopg2 (psycopg2-binary alternative)
    
    tensorflow ==1.15.0
    
    tensorforce==0.4.3
    
    matplotlib
    
    Python=3.6
    
    mo-future=3.147
    
    moz-sql-parser==4.18
    
    Pillow = 8.1.0
    
    
    

### Postgres

1> download postgres into ubuntu system follow this: [part1](https://www.postgresql.org/download/linux/ubuntu/)

2> access to [part2](https://dev.to/ohaleks/set-up-wsl2-postgresql-and-phoenix-liveview-on-windows-3ol5)
    
    a> sudo service postgresql status   //to check status
    
    b> sudo service postgresql start    // start server
    
    c> sudo service postgresql status   //double check status is 'online' now

### Download join order benchmark, datbase part

1>  git clone [this repo](https://github.com/gregrahn/join-order-benchmark.git) to your local ubuntu system
    
(you may need to set up ssh key in your local linux system to use your github account, one reference: [ssh key generation](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key))

2>  access to [this page](https://github.com/gregrahn/join-order-benchmark/tree/e6d4aba307a0f8849b681ccbd2ca04381d3d1731) to follow section 'Step-by-step instructions'
    
    a> do 1>download *gz files
    
    b> skip 2>, directly go to https://github.com/alberanid/imdbpy, follow 'Installation' section
    
    c> before 3>, create a postgres account, follow https://dev.to/ohaleks/set-up-wsl2-postgresql-and-phoenix-liveview-on-windows-3ol5, use: sudo -u postgres createuser <your_username>  
    make sure to run the command in the directory that postgres has access to like /tmp
    (ps: need to lift the access ability, can be done later, use postgres: sudo -u postgres createdb imdbload)
    
    d> before 4>, go to https://dev.to/ohaleks/set-up-wsl2-postgresql-and-phoenix-liveview-on-windows-3ol5, 
        follow from: sudo -u postgres psql.
        after give privileges, use \l to make sure imdbload is there.
    
    e 4> python3 imdbpy2sql.py -d PATH_TO_GZ_FILES -u postgres://username:password@hostname/imdbload
        ps:
            1>here change PATH_TO_GZ_FILES to the absolute path of your downloaded gz files
            2>change username and password to your own 
            3>change hostname to 'localhost'
**The last step will take a loooong time, wait for processing...** after this, download join order benchmark database part is finished. 

### Run join order benchmark, query part

1>  Manually run two sql query 'schema.sql' and 'fkindexes.sql' (in the project, under jo-benchmark/)

    a> use 'sudo -u postgres psql' to start postgres cli
    
    b> in postgres, switch to imdbload: \c imdbload
    
    c> use \dt to make sure you have datasets in it.
    
    d> open schema.sql, copy and paste to excute the sql sentences in postgres(your linux, imdbload environment)
    * All of those sql sentences in this file should already been done by previous steps, we only need add 'movie_info_idx':
    'CREATE TABLE movie_info_idx (
    id integer NOT NULL PRIMARY KEY,
    movie_id integer NOT NULL,
    info_type_id integer NOT NULL,
    info text NOT NULL,
    note text
    );'
    
    e> open fkindexes.sql, excute the sql sentences in postgres

2> run queires2db.py(under porject directory) to get table 'queries'

    a> change configuration in /home/PycharmProjects/ReJOIN/config/database.py to your own account
    b> you may need to assgin superuser to your own account: ALTER USER your_user WITH SUPERUSER;
    some hints for postgres:
      to delete a table: drop table table_name
     
3> run main.py to make sure the rejoin repo is working.

### Re-product the experiment section:

- https://drive.google.com/open?id=1bOBtplkxfGXGRWmib4WYMotjJ47fGz2C
      
### Test on TPCH data set

follow https://github.com/gregrahn/tpch-kit

### Run examples
After finished all the steps above, follow below 'Some Running examples' to try training and other process.


### Some Running examples (optional)

- Train target group 4 for 200 episodes
`sudo python3 main.py -e 200 -g 1 -tg 4 -se 100 -s ./saved_model/group4-200/`

Now the plots are in ./outputs folder (default) and the model in  ./saved_model/ 

- Restore saved model and test group 4 
`sudo python3 main.py -e 3 -g 1 -tg 4 -r ./saved_model/group4-200/ --testing -o ./outputs/testing/`


- Restore saved model and keep training on group 5 for 500 episodes
`sudo python3 main.py -e 200 -g 1 -tg 5 -se 100 -r ./saved_model/group4-200/ -s ./saved_model/group5-500/`

- Execute a single query `python main.py --query 3a --episodes 150`
