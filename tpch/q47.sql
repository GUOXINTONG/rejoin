-- using 1433771997 as a seed to the RNG


select
	c.c_custkey,
	c.c_name,
	c.c_acctbal,
	n.n_name,
	c.c_address,
	c.c_phone,
	c.c_comment,
	s.s_phone
from
	customer as c,
	orders as o,
	lineitem as l,
	nation as n,
	supplier as s
where
	c.c_custkey = o.o_custkey
	and l.l_orderkey = o.o_orderkey
	and l.l_returnflag = 'R'
	and c.c_nationkey = n.n_nationkey
	and s.s_suppkey = l.l_suppkey
	and s.s_nationkey = n.n_nationkey
group by
	c.c_custkey,
	c.c_name,
	c.c_acctbal,
	c.c_phone,
	n.n_name,
	c.c_address,
	c.c_comment,
	s.s_phone
order by
    c.c_acctbal
LIMIT 20;
