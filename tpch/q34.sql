-- using 1433771997 as a seed to the RNG


select
	n.n_name,
	p.p_size,
	ps.ps_suppkey
from
	customer as c,
	orders as o,
	lineitem as l,
	supplier as s,
	nation as n,
	region as r,
	part as p,
	partsupp as ps
where
	c.c_custkey = o.o_custkey
	and l.l_orderkey = o.o_orderkey
	and l.l_suppkey = s.s_suppkey
	and c.c_nationkey = s.s_nationkey
	and s.s_nationkey = n.n_nationkey
	and n.n_regionkey = r.r_regionkey
	and r.r_name = 'MIDDLE EAST'
	and p.p_partkey = ps.ps_partkey
	and s.s_suppkey = ps.ps_suppkey
	and p.p_size < 30
	and ps.ps_suppkey < 88
group by
    ps.ps_suppkey,
    p.p_size,
	n.n_name;


