select *
from {{ source('raw_data', 'yellow_tripdata')}}
where VendorID is not null