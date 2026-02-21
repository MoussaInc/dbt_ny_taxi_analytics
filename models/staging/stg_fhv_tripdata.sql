select *
from {{ source('raw_data', 'fhv_tripdata')}}
where dispatching_base_num is not null