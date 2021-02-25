-- using 1433771997 as a seed to the RNG


select
	n.n_name
--	sum(l_extendedprice * (1 - l_discount)) as revenue
from
	customer as c,
	orders as o,
	lineitem as l,
	supplier as s,
	nation as n,
	region as r
where
	c.c_custkey = o.o_custkey
	and l.l_orderkey = o.o_orderkey
	and l.l_suppkey = s.s_suppkey
	and c.c_nationkey = s.s_nationkey
	and s.s_nationkey = n.n_nationkey
	and n.n_regionkey = r.r_regionkey
	and r.r_name = 'MIDDLE EAST'
--	and o_orderdate >= date '1994-01-01'
--	and o_orderdate < date '1994-01-01' + interval '1' year
group by
	n.n_name
--order by
--	revenue desc;

