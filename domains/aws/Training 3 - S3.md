Amazon Simple Storage Service
- Buckets & Objects.
- Object have a key & the key is the full path (prefix + object_name).
- query in place.
- Amazon Athena can be used to query unstructured data in S3.
- S3 objects can be versioned.
- Amazon Glacier can be used to archive old data.
- Amazon S3 transfer acceleration
- Use Cloudfront as proxy to cache s3 access.
- Intelligent tiering vs. Custom Lifecycle policy.


S3 Security:
- Bucket Policy that applies to all the objects in the bucket (IAM JSON).
- Resource based security on specific Objects through ACL.
- User based IAM Policy.
- Bucket policy has the highest precedence.
- Enforce encryption with bucket policy.
- Cross account access can be given by using trust policies.
- Encryption:
    - Encryption in transit with HTTPs.
    - Encryption at rest - SSE with s3 managed keys (header z-amz-server-side-encryption=AES256)
    - Encryption at rest - SSE with SSE custom keys 
    - Encryption at rest - SSE with KMS keys (header z-amz-server-side-encryption=aws:kms)
    - Client side encryption


S3 Features:
- Data Lake Concepts for analytics such as Athena, Redshift spectrum.
- Events: Trigger notifications to SNS, SQS, Lambda for certain events in the bucket.
- Static web hosting.
- Lifecycle management: rules to transition objects to cheap tier or deletion.
- Requester pays option: Downloader pays.
- Multi-part upload.
- Byte range downloads: by downloading chunks in byte ranges.


S3 properties:
- Bucket should be universally unique.
- S3 Standard: 99.99% availability & 11 9's durability.
- Strong consistency.
- Object URL = https://<bucket name>.s3.<region>.amazonaws.com/<object key>
- more prefixes (i.e subfolders) will increase performance.


S3 storage classes:
- S3 Standard: High-performance storage for frequently accessed data.
- S3 Intelligent-Tiering: Automatically moves data between access tiers based on usage patterns.
- S3 Standard-IA: Lower-cost storage for infrequently accessed data.
- S3 One Zone-IA: Lower-cost storage in a single Availability Zone.
- S3 Glacier: Low-cost storage for long-term archiving.
- S3 Glacier Deep Archive: Lowest-cost storage for infrequently accessed and archived data.


Challenges:
- Hosting a static website using s3 bucket
- Changing permissions on a bucket through policy defined in JSON
- setting lifecycle policy for the current version and older versions
- setting replication for a bucket


How is authentication and authorization handled when a program accesses an S3 object?
Ans: It is also controlled through IAM

Example Permission policy for an S3 bucket
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Statement1",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:Get*",
                "s3:List*"
            ],
            "Resource": "arn:aws:s3:::website-229-replica-1/*"
        },
        {
            "Sid": "Statement1",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetBucketObjectLockConfiguration",
            "Resource": "arn:aws:s3:::website-229-replica-1"
        }
    ]
}
```