-- using 1433771997 as a seed to the RNG


select
	c.c_custkey,
	n.n_name,
	p.p_name
from
	customer as c,
	orders as o,
	lineitem as l,
	nation as n,
	partsupp as ps,
	part as p
where
	c.c_custkey = o.o_custkey
	and l.l_orderkey = o.o_orderkey
	and l.l_returnflag = 'R'
	and c.c_nationkey = n.n_nationkey
	and ps.ps_partkey = p.p_partkey
	and l.l_partkey = ps.ps_partkey
	and l.l_suppkey = ps.ps_suppkey
group by
	c.c_custkey,
	n.n_name,
	p.p_name
LIMIT 20;
