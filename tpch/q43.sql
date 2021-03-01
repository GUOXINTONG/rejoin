-- using 1433771997 as a seed to the RNG


select
	c.c_name,
	c.c_custkey,
	o.o_orderkey,
	o.o_orderdate,
	o.o_totalprice
from
	customer as c,
	orders as o,
	lineitem as l,
	nation as n,
	region as r
where
    c.c_custkey = o.o_custkey
	and o.o_orderkey = l.l_orderkey
	and n.n_nationkey = c.c_nationkey
	and r.r_regionkey = n.n_nationkey
	and r.r_name = 'EUROPE'
	and o.o_totalprice > 500000
group by
	c.c_name,
	c.c_custkey,
	o.o_orderkey,
	o.o_orderdate,
	o.o_totalprice
order by
	o.o_totalprice desc,
	o.o_orderdate
LIMIT 100;
