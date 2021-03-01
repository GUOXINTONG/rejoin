-- using 1433771997 as a seed to the RNG


select
	l.l_shipmode,
	o.o_orderkey,
	r.r_name
from
	orders as o,
	lineitem as l,
	region as r,
	nation as n,
	customer as c
where
	o.o_orderkey = l.l_orderkey
	and l.l_shipmode = 'FOB'
	and l.l_commitdate < l.l_receiptdate
	and l.l_shipdate < l.l_commitdate
	and o.o_orderpriority = '1-URGENT'
	and r.r_regionkey = n.n_regionkey
	and n.n_nationkey = c.c_nationkey
	and c.c_custkey = o.o_custkey
group by
	l.l_shipmode,
	o.o_orderkey,
	r.r_name
order by
	l.l_shipmode;

