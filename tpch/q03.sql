-- using 1433771997 as a seed to the RNG


select
	l.l_orderkey,
--	max(l.l_extendedprice * (1 - l.l_discount)) as revenue,
	o.o_orderdate,
	o.o_shippriority
from
	customer as c,
	orders as o,
	lineitem as l
where
	c.c_mktsegment = 'FURNITURE'
	and c.c_custkey = o.o_custkey
	and l.l_orderkey = o.o_orderkey
--	and o.o_orderdate < date '1995-03-29'
--	and l.l_shipdate > date '1995-03-29'
group by
	l.l_orderkey,
	o.o_orderdate,
	o.o_shippriority
order by
--	revenue desc,
	o.o_orderdate
LIMIT 10;
