-- using 1433771997 as a seed to the RNG


select
	s.s_acctbal,
	s.s_name,
	n.n_name,
	p.p_partkey,
	p.p_mfgr,
	s.s_address,
	s.s_phone,
	s.s_comment,
	o.o_totalprice
from
	part as p,
	supplier as s,
	partsupp as ps,
	nation as n,
	region as r,
	customer as c,
	lineitem as l,
	orders as o
where
	p.p_partkey = ps.ps_partkey
	and s.s_suppkey = ps.ps_suppkey
	and p.p_size = 40
	and s.s_nationkey = n.n_nationkey
	and n.n_regionkey = r.r_regionkey
	and c.c_nationkey = s.s_nationkey
	and l.l_partkey = p.p_partkey
	and o.o_orderkey = l.l_orderkey
	and o.o_totalprice > 200000
order by
	s.s_acctbal desc,
	n.n_name,
	s.s_name,
	p.p_partkey
LIMIT 100;
