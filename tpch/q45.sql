-- using 1433771997 as a seed to the RNG


select
	s.s_name,
	r.r_comment,
	p.p_comment,
	c.c_comment,
	ps.ps_comment
from
	supplier as s,
	lineitem l1,
	orders as o,
	nation as n,
	region as r,
	part as p,
	partsupp as ps,
	customer as c
where
	s.s_suppkey = l1.l_suppkey
	and o.o_orderkey = l1.l_orderkey
	and o.o_orderstatus = 'F'
	and l1.l_receiptdate > l1.l_commitdate
	and s.s_nationkey = n.n_nationkey
	and n.n_name = 'GERMANY'
	and r.r_regionkey = n.n_regionkey
	and p.p_partkey = l1.l_partkey
	and c.c_custkey = o.o_custkey
	and ps.ps_partkey = p.p_partkey
group by
	s.s_name,
	r.r_comment,
    p.p_comment,
    c.c_comment,
	ps.ps_comment
order by
	s.s_name
LIMIT 100;
