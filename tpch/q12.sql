-- using 1433771997 as a seed to the RNG


select
	l.l_shipmode
--	sum(case
--		when o_orderpriority = '1-URGENT'
--			or o_orderpriority = '2-HIGH'
--			then 1
--		else 0
--	end) as high_line_count,
--	sum(case
--		when o_orderpriority <> '1-URGENT'
--			and o_orderpriority <> '2-HIGH'
--			then 1
--		else 0
--	end) as low_line_count
from
	orders as o,
	lineitem as l
where
	o.o_orderkey = l.l_orderkey
--	and l_shipmode in ('FOB', 'SHIP')
	and l.l_commitdate < l.l_receiptdate
	and l.l_shipdate < l.l_commitdate
--	and l_receiptdate >= date '1994-01-01'
--	and l_receiptdate < date '1994-01-01' + interval '1' year
group by
	l.l_shipmode
order by
	l.l_shipmode;

