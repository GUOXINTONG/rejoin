-- using 1433771997 as a seed to the RNG


select
	c.c_name,
	ps.ps_comment
from
	customer as c,
	orders as o,
	lineitem as l,
	supplier as s,
	nation as n,
	partsupp as ps
where
	c.c_custkey = o.o_custkey
	and l.l_orderkey = o.o_orderkey
	and l.l_suppkey = s.s_suppkey
	and c.c_nationkey = s.s_nationkey
	and s.s_nationkey = n.n_nationkey
	and s.s_suppkey = ps.ps_suppkey
	and n.n_name = 'BRAZIL'
group by
	c.c_name,
	ps.ps_comment
limit 100;
