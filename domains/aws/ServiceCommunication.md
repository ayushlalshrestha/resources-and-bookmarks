

1. SQS: Asynchronous Queue model
    - No limit on throughput (MPS) & Number of messages on the queue
    - retention: 4D to 14D
    - Max 10ms latency on reads and writes
    - Max 265KB
    - Use AutoScalingGroup to scale consumers based on QueueLength metric (ApproximateNumberOfMessages) from CloudWatch through CloudWatch Alarm

2. SNS: Pub/Sub model
    - An SQS can be a consumer to an SNS

3. Kinesis: Real time streaming of Big data
    - Kinesis data streams
        - capture, process & store data streams
        - similar to kafka, with shards (as brokers in kafka) and partitions (each partition is stored in a different shard)
        - A partition key is hashed to point to a shard which stores the message
        - Producers: Kinesis Agent, AWS SDK for Java, KPL (kinesis producer library)
        - Consumers: Kinesis data analytics, KCL (kinesis consumer library)
    - Kinesis data firehose: load data streams into AWS data store
    - Kinesis data analytics
        - analyze data streams with SQL or Apache Flink
        - stream processing with SQL statements
            
