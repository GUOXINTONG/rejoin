-- using 1433771997 as a seed to the RNG


select
	l.l_orderkey,
	o.o_orderdate,
	o.o_shippriority,
	n.n_name
from
	customer as c,
	orders as o,
	lineitem as l,
	nation as n
where
	c.c_mktsegment = 'FURNITURE'
	and c.c_custkey = o.o_custkey
	and l.l_orderkey = o.o_orderkey
	and n.n_nationkey = c.c_nationkey
	and n.n_name = 'UNITED KINGDOM'
group by
	l.l_orderkey,
	o.o_orderdate,
	o.o_shippriority,
	n.n_name
order by
	o.o_orderdate,
	l.l_orderkey
LIMIT 10;
