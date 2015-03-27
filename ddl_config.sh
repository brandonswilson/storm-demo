#!/bin/bash
echo 'Creating Hive tables...'
hive -f truck_events.ddl
runuser -l hdfs -c 'hadoop fs -chown -R storm /apps/hive/warehouse/truck_events_text_partition'
runuser -l hdfs -c 'hadoop fs -chown -R storm /apps/hive/warehouse/truck_events_orc_partition_single'

echo 'Creating HBase tables...'

echo 'Creating driver_dangerous_events table...'
echo "create 'driver_dangerous_events', {NAME=> 'events', VERSIONS=>3}" | hbase shell

echo 'Creating driver_dangerous_events_count table...'
echo "create 'driver_dangerous_events_count', {NAME=> 'counters', VERSIONS=>3}" | hbase shell

echo 'Creating driver_events table...'
echo "create 'driver_events', {NAME=> 'allevents', VERSIONS=>3}" | hbase shell
