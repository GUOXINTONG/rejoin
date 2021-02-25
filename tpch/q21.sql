-- using 1433771997 as a seed to the RNG


select
	s.s_name
--	count(*) as numwait
from
	supplier as s,
	lineitem l1,
	orders as o,
	nation as n
where
	s.s_suppkey = l1.l_suppkey
	and o.o_orderkey = l1.l_orderkey
	and o.o_orderstatus = 'F'
	and l1.l_receiptdate > l1.l_commitdate
--	and exists (
--		select
--			*
--		from
--			lineitem l2
--		where
--			l2.l_orderkey = l1.l_orderkey
--			and l2.l_suppkey <> l1.l_suppkey
--	)
--	and not exists (
--		select
--			*
--		from
--			lineitem l3
--		where
--			l3.l_orderkey = l1.l_orderkey
--			and l3.l_suppkey <> l1.l_suppkey
--			and l3.l_receiptdate > l3.l_commitdate
--	)
	and s.s_nationkey = n.n_nationkey
	and n.n_name = 'GERMANY'
group by
	s.s_name
order by
--	numwait desc,
	s.s_name
LIMIT 100;
