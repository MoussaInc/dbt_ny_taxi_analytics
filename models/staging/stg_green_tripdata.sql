select *
from {{ source('raw_data', 'green_tripdata')}}
where VendorID is not null