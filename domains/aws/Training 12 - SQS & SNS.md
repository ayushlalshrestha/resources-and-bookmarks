

SQS: Asynchronous Queue model
- As the name suggests, a queue in which multiple producers produce messages & multiple consumers can consume them, then delete the message by calling the DeleteMessage API
- No limit on throughput (MPS) & Number of messages on the queue
- retention: 4D to 14D
- Max 10ms latency on reads and writes
- Max 265KB
- Use AutoScalingGroup to scale consumers based on QueueLength metric (ApproximateNumberOfMessages) from CloudWatch through CloudWatch Alarm
- SQS Types:
    - Standard: A message could be delivered more than once, no order guarantee 
    - FIFOs: Maintains ordering
- Visibility timeout of messages: Time to call DeleteAPI within visibility timeout period after consuming a message. During this period, other consumers wont see this message.
- Long polling vs. Short polling


SNS: Pub/Sub model
- An SQS can be a subscriber to an SNS
- SNS Types:
    - Standard: A message could be delivered more than once, no order guarantee 
    - FIFOs: Maintains ordering, can only publish to SQS
- eg. S3 bucket could write events into an SNS


Kinesis: Real time streaming of Big data
- Kinesis data streams
    - capture, process & store data streams
    - similar to kafka, with shards (as brokers in kafka) and partitions (each partition is stored in a different shard)
    - A partition key is hashed to point to a shard which stores the message
    - Producers: Kinesis Agent, AWS SDK for Java, KPL (kinesis producer library)
    - Consumers: Kinesis data analytics, KCL (kinesis consumer library)
- Kinesis data firehose
    - load data streams into AWS data store (eg. S3)
    - acts as a store_handler
- Kinesis data analytics
    - take data from sources like data stream, firehose
    - analyze data streams with SQL or Apache Flink
    - stream processing with SQL statements
            

Amazon MQ as alternative to RabbitMQ