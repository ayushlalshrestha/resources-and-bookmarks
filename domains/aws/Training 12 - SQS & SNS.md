

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
- In FIFO queues, message can have group_id to group messages


SNS: Pub/Sub model
- A `topic` is `subscribed` by a Subscription
- An SQS can be a subscriber to an SNS.
- SNS Types:
    - Standard: A message could be delivered more than once, no order guarantee 
    - FIFOs: Maintains ordering, can only publish to SQS
- eg. S3 bucket could write events into an SNS.
