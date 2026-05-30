-- =====================================================
-- DATA WAREHOUSE DDL — generated from DFM Fact Schema
-- Generated: 2026-05-30T08:34:13.106874
-- =====================================================

CREATE TABLE dim_loads (
    dim_loads_sk SERIAL PRIMARY KEY,
    load_id VARCHAR(50) UNIQUE NOT NULL,
    load_type VARCHAR(100),
    booking_type VARCHAR(100),
    load_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE dim_drivers (
    dim_drivers_sk SERIAL PRIMARY KEY,
    driver_id VARCHAR(50) UNIQUE NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    hire_date VARCHAR(100),
    termination_date VARCHAR(100),
    employment_status VARCHAR(100),
    years_experience VARCHAR(100),
    load_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE dim_trucks (
    dim_trucks_sk SERIAL PRIMARY KEY,
    truck_id VARCHAR(50) UNIQUE NOT NULL,
    make VARCHAR(100),
    model_year VARCHAR(100),
    status VARCHAR(100),
    load_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE dim_trailer (
    dim_trailer_sk SERIAL PRIMARY KEY,
    trailer_id VARCHAR(50) UNIQUE NOT NULL,
    trailer_type VARCHAR(100),
    model_year VARCHAR(100),
    status VARCHAR(100),
    load_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE dim_customer (
    dim_customer_sk SERIAL PRIMARY KEY,
    customer_id VARCHAR(50) UNIQUE NOT NULL,
    customer_name VARCHAR(100),
    customer_type VARCHAR(100),
    primary_freight_type VARCHAR(100),
    account_status VARCHAR(100),
    load_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE dim_routes (
    dim_routes_sk SERIAL PRIMARY KEY,
    route_id VARCHAR(50) UNIQUE NOT NULL,
    origin_city VARCHAR(100),
    destination_city VARCHAR(100),
    typical_distance_miles VARCHAR(100),
    base_rate_per_mile VARCHAR(100),
    fuel_surcharge_rate VARCHAR(100),
    typical_transit_days VARCHAR(100),
    origin_state VARCHAR(100),
    destination_state VARCHAR(100),
    origin_region VARCHAR(100),
    destination_region VARCHAR(100),
    load_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE dim_facilities (
    dim_facilities_sk SERIAL PRIMARY KEY,
    pickup_facility_id VARCHAR(50) UNIQUE NOT NULL,
    pickup_facility_name VARCHAR(100),
    pickup_facility_type VARCHAR(100),
    pickup_city VARCHAR(100),
    pickup_state VARCHAR(100),
    pickup_latitude VARCHAR(100),
    pickup_longitude VARCHAR(100),
    load_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE dim_date (
    dim_date_sk SERIAL PRIMARY KEY,
    date_id VARCHAR(50) UNIQUE NOT NULL,
    date VARCHAR(100),
    day VARCHAR(100),
    weekday VARCHAR(100),
    month VARCHAR(100),
    quarter VARCHAR(100),
    year VARCHAR(100),
    load_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE fact_trips (
    fact_trips_sk SERIAL PRIMARY KEY,
    dim_loads INTEGER REFERENCES dim_loads(dim_loads_sk),
    dim_drivers INTEGER REFERENCES dim_drivers(dim_drivers_sk),
    dim_trucks INTEGER REFERENCES dim_trucks(dim_trucks_sk),
    dim_trailer INTEGER REFERENCES dim_trailer(dim_trailer_sk),
    dim_customer INTEGER REFERENCES dim_customer(dim_customer_sk),
    dim_routes INTEGER REFERENCES dim_routes(dim_routes_sk),
    dim_facilities INTEGER REFERENCES dim_facilities(dim_facilities_sk),
    dim_date INTEGER REFERENCES dim_date(dim_date_sk),
    actual_distance_miles INTEGER -- additive,
    fuel_gallons_used INTEGER -- additive,
    average_mpg INTEGER -- non_additive,
    idle_time_hours INTEGER -- additive,
    actual_duration_hours INTEGER -- additive,
    fuel_gallons_purchased INTEGER -- additive,
    fuel_purchased_cost INTEGER -- additive,
    revenue INTEGER -- additive,
    fuel_surcharge INTEGER -- additive,
    accessorial_charges INTEGER -- additive,
    weight_lbs INTEGER -- non_additive,
    planned_pickup_time INTEGER -- non_additive,
    actual_pickup_time INTEGER -- non_additive,
    planned_delivery_time INTEGER -- non_additive,
    actual_delivery_time INTEGER -- non_additive,
    detention_minutes_pickup INTEGER -- additive,
    detention_minutes_delivery INTEGER -- additive,
    detention_minutes_total INTEGER -- additive,
    planned_duration_hours INTEGER -- additive,
    pickup_delay_hours INTEGER -- additive,
    delivery_delay_hours INTEGER -- additive,
    delay_hours INTEGER -- additive,
    profit INTEGER -- additive,
    profit_margin INTEGER -- non_additive,
    fuel_spend_per_mile INTEGER -- non_additive,
    on_time_flag INTEGER -- non_additive,
    delay_category INTEGER -- non_additive,
    load_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Indexes on foreign keys for join performance
CREATE INDEX idx_fact_trips_dim_loads ON fact_trips(dim_loads);
CREATE INDEX idx_fact_trips_dim_drivers ON fact_trips(dim_drivers);
CREATE INDEX idx_fact_trips_dim_trucks ON fact_trips(dim_trucks);
CREATE INDEX idx_fact_trips_dim_trailer ON fact_trips(dim_trailer);
CREATE INDEX idx_fact_trips_dim_customer ON fact_trips(dim_customer);
CREATE INDEX idx_fact_trips_dim_routes ON fact_trips(dim_routes);
CREATE INDEX idx_fact_trips_dim_facilities ON fact_trips(dim_facilities);
CREATE INDEX idx_fact_trips_dim_date ON fact_trips(dim_date);