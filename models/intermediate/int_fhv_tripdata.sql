with renamed as (
    select
        dispatching_base_num,
        pickup_datetime,
        cast(dropOff_datetime as timestamp) as dropoff_datetime,
        cast(PUlocationID as int64) as pickup_location_id,
        cast(DOlocationID as int64) as dropoff_location_id,
        SR_Flag as sr_flag,
        Affiliated_base_number as affiliated_base_number
    from {{ ref("stg_fhv_tripdata") }}  
)

select * from renamed