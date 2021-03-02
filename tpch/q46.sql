-- using 1433771997 as a seed to the RNG


select
	c.c_custkey,
	c.c_name,
	c.c_acctbal,
	n.n_name,
	c.c_address,
	c.c_phone,
	c.c_comment,
	r.r_name,
	o.o_orderdate
from
	customer as c,
	orders as o,
	lineitem as l,
	nation as n,
	region as r
where
	c.c_custkey = o.o_custkey
	and l.l_orderkey = o.o_orderkey
	and o.o_orderdate = '1992-04-19'
	and l.l_returnflag = 'R'
	and c.c_nationkey = n.n_nationkey
	and r.r_regionkey = n.n_regionkey
group by
	c.c_custkey,
	c.c_name,
	c.c_acctbal,
	c.c_phone,
	n.n_name,
	c.c_address,
	c.c_comment,
	r.r_name,
	o.o_orderdate
LIMIT 20;
