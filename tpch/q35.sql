-- using 1433771997 as a seed to the RNG


select
	s.s_name
from
	supplier as s,
	lineitem l1,
	orders as o,
	nation as n,
	region as r
where
	s.s_suppkey = l1.l_suppkey
	and o.o_orderkey = l1.l_orderkey
	and o.o_orderstatus = 'F'
	and l1.l_receiptdate > l1.l_commitdate
	and s.s_nationkey = n.n_nationkey
	and r.r_name = 'EUROPE'
	and n.n_regionkey = r.r_regionkey
	and n.n_name = 'GERMANY'
group by
    r.r_name,
	s.s_name
order by
	s.s_name
LIMIT 100;
