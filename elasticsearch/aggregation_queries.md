
## Simple group by queries
```json
POST /logs/_search
{
  "size": 0,
  "aggs": {
    "logs_per_user": {
      "terms": {
        "field": "username.keyword",  // Use .keyword for exact match on text fields
        "size": 100  // Number of top terms to return, adjust as needed
      }
    }
  }
}
```

```json
POST /logs/_search
{
  "size": 0,
  "query": {
    "range": {
      "timestamp": {
        "gte": "000000",  // Replace with your start timestamp
        "lte": "1708228604"   // Replace with your end timestamp
      }
    }
  },
  "aggs": {
    "logs_per_user": {
      "terms": {
        "field": "username.keyword",  // Use .keyword for exact match on text fields
        "size": 100  // Number of top terms to return, adjust as needed
      }
    }
  }
}
```