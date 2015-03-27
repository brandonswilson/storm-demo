create table truck_events_text_partition(
      driverId         int
,     truckId         int
,     eventTime       string 
,     eventType          string
,     longitude         double
,     latitude           double
,     eventKey        string
,     correlationId     bigint
,     driverName	string
,     routeId		int
,     routeName		string
)
partitioned by (date string)
row format delimited fields terminated by ',';

create table truck_events_orc_partition_single(
      driverId         int
,     truckId         int
,     eventTime       string 
,     eventType          string
,     longitude         double
,     latitude           double
,     eventKey        string
,     correlationId     bigint
,     driverName	string
,     routeId		int
,     routeName		string
)
partitioned by (date string)
row format serde 'org.apache.hadoop.hive.ql.io.orc.OrcSerde'
stored as orc;
