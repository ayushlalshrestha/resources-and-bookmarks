import datetime
import json
import random
import boto3

STREAM_NAME = "Logs"
region_name = "us-east-1"


def get_data():
    """Gets a random piece of data."""
    event_time = datetime.datetime.now().isoformat()
    ticker = random.choice(["AAPL", "AMZN", "MSFT", "INTC", "TBV"])
    price = round(random.random() * 100, 2)
    return {
        "event_time": event_time,
        "ticker": ticker,
        "price": price,
    }


def generate(stream_name, kinesis_client):
    """Generates and puts logs to Kinesis."""
    while True:
        data = get_data()

        response = kinesis_client.put_record(
            StreamName=stream_name, Data=json.dumps(data), PartitionKey="partitionkey"
        )
        print(response["ResponseMetadata"])
        print(response["ShardId"])
        print(response["SequenceNumber"])
        break


def consume_logs(stream_name, kinesis_client):
    shard_iterator = kinesis_client.get_shard_iterator(
        StreamName=stream_name,
        ShardId="shardId-000000000003",  # Replace with the desired shard ID
        ShardIteratorType="LATEST",
    )["ShardIterator"]

    while True:
        response = kinesis_client.get_records(ShardIterator=shard_iterator, Limit=100)

        records = response["Records"]
        for record in records:
            data = record["Data"].decode("utf-8")
            print(f"Received log: {data}")

        if not records:
            print(f"No records found")
            break

        shard_iterator = response["NextShardIterator"]


if __name__ == "__main__":
    kinesis_client = boto3.client("kinesis", region_name=region_name)
    generate(STREAM_NAME, kinesis_client)
    consume_logs(STREAM_NAME, kinesis_client)
