select
	o.o_orderdate as o_orderdate,
	n2.n_name as nation
from
	part as p,
	supplier as s,
	lineitem as l,
	orders as o,
	customer as c,
	nation as n1,
	nation as n2,
	region as r
where
	p.p_partkey = l.l_partkey
	and s.s_suppkey = l.l_suppkey
	and l.l_orderkey = o.o_orderkey
	and o.o_custkey = c.c_custkey
	and c.c_nationkey = n1.n_nationkey
	and n1.n_nationkey = r.r_regionkey
	and s.s_nationkey = n2.n_nationkey
order by
	o_orderdate;
