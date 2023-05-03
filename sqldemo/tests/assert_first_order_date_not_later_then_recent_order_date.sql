with
    input as (
        select
        (cast(convert(char(8), [first_order_date], 112) as int)  - cast(convert(char(8), [most_recent_order_date], 112) as int)) as [difference]
        from {{ ref("dim_customer") }}
        where ([first_order_date] > [most_recent_order_date])
    )

select [difference]
from input
