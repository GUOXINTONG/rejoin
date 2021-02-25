select
	n.n_name AS n_name
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
order by 
	n_name desc;
