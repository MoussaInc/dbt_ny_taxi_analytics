with green_trips as (
    select
        cast(VendorID as int64) as vendor_id,
        cast(RatecodeID as int64) as rate_code_id,
        cast(PULocationID as int64) as pickup_location_id,
        cast(DOLocationID as int64) as dropoff_location_id,
        cast(lpep_pickup_datetime as timestamp) as pickup_datetime,
        cast(lpep_dropoff_datetime as timestamp) as dropoff_datetime,
        store_and_fwd_flag,
        cast(passenger_count as int64) as passenger_count,
        cast(trip_distance as float64) as trip_distance,
        cast(trip_type as int64) as trip_type,
        cast('green' as string) as service_type,
        cast(fare_amount as numeric) as fare_amount,
        cast(extra as numeric) as extra,
        cast(mta_tax as numeric) as mta_tax,
        cast(tip_amount as numeric) as tip_amount,
        cast(tolls_amount as numeric) as tolls_amount,
        cast(ehail_fee as numeric) as ehail_fee,
        cast(improvement_surcharge as numeric) as improvement_surcharge,
        cast(total_amount as numeric) as total_amount,
        cast(payment_type as int64) as payment_type
    from {{ ref('stg_green_tripdata') }}
),

yellow_trips as (
    select
        cast(VendorID as int64) as vendor_id,
        cast(RatecodeID as int64) as rate_code_id,
        cast(PULocationID as int64) as pickup_location_id,
        cast(DOLocationID as int64) as dropoff_location_id,
        cast(tpep_pickup_datetime as timestamp) as pickup_datetime,
        cast(tpep_dropoff_datetime as timestamp) as dropoff_datetime,
        store_and_fwd_flag,
        cast(passenger_count as int64) as passenger_count,
        cast(trip_distance as float64) as trip_distance,
        cast(1 as int64) as trip_type,
        cast('yellow' as string) as service_type,
        cast(fare_amount as numeric) as fare_amount,
        cast(extra as numeric) as extra,
        cast(mta_tax as numeric) as mta_tax,
        cast(tip_amount as numeric) as tip_amount,
        cast(tolls_amount as numeric) as tolls_amount,
        cast(0 as numeric) as ehail_fee,
        cast(improvement_surcharge as numeric) as improvement_surcharge,
        cast(total_amount as numeric) as total_amount,
        cast(payment_type as int64) as payment_type
    from {{ ref('stg_yellow_tripdata') }}
)

select * from green_trips
union all
select * from yellow_trips