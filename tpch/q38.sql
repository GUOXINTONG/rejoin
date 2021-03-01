-- using 1433771997 as a seed to the RNG


select
	s.s_name,
	c.c_comment
from
	supplier as s,
	lineitem l1,
	orders as o,
	nation as n,
	region as r,
	customer as c
where
	s.s_suppkey = l1.l_suppkey
	and o.o_orderkey = l1.l_orderkey
	and o.o_orderstatus = 'F'
	and l1.l_receiptdate > l1.l_commitdate
	and s.s_nationkey = n.n_nationkey
	and r.r_name = 'EUROPE'
	and n.n_regionkey = r.r_regionkey
	and n.n_name = 'GERMANY'
	and c.c_nationkey = n.n_nationkey
group by
    r.r_name,
	s.s_name,
	c.c_comment
order by
	s.s_name
LIMIT 100;
