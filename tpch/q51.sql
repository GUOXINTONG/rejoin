-- using 1433771997 as a seed to the RNG


select
	p.p_brand,
	p.p_type,
	p.p_size,
	r.r_name,
	l.l_tax,
	c.c_name
from
	partsupp as ps,
	part as p,
	region as r,
	nation as n,
	supplier as s,
	orders as o,
	lineitem as l,
	customer as c
where
	p.p_partkey = ps.ps_partkey
	and p.p_brand <> 'Brand#11'
	and p.p_type not like 'SMALL PLATED%'
	and r.r_regionkey = n.n_regionkey
	and r.r_name not like 'EUROPE'
	and n.n_nationkey = s.s_nationkey
	and o.o_orderkey = l.l_orderkey
	and o.o_custkey = c.c_custkey
	and s.s_suppkey = l.l_suppkey
	and p.p_partkey = l.l_partkey
group by
	p.p_brand,
	p.p_type,
	p.p_size,
	r.r_name,
	l.l_tax,
	c.c_name
order by
	p.p_brand,
	p.p_type,
	p.p_size
limit 100;

