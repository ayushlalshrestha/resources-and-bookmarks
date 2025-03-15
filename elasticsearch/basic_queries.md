Querying OpenSearch/Elasticsearch can be very powerful for extracting meaningful insights from your data. Below are 10 examples of commonly used and useful queries in OpenSearch/Elasticsearch:

### 1. Match Query
**Purpose**: Find documents that match a specific term.

```json
{
  "query": {
    "match": {
      "title": "OpenSearch"
    }
  }
}
```
**Explanation**: This query searches for documents where the `title` field contains the term "OpenSearch".

### 2. Term Query
**Purpose**: Find documents that contain the exact term in a field.

```json
{
  "query": {
    "term": {
      "status": "active"
    }
  }
}
```
**Explanation**: This query retrieves documents where the `status` field is exactly "active".

### 3. Range Query
**Purpose**: Find documents with values within a specified range.

```json
{
  "query": {
    "range": {
      "age": {
        "gte": 25,
        "lte": 35
      }
    }
  }
}
```
**Explanation**: This query finds documents where the `age` field is between 25 and 35, inclusive.

### 4. Bool Query
**Purpose**: Combine multiple queries using boolean logic.

```json
{
  "query": {
    "bool": {
      "must": [
        { "match": { "title": "OpenSearch" } },
        { "term": { "status": "active" } }
      ],
      "filter": [
        { "range": { "age": { "gte": 25, "lte": 35 } } }
      ]
    }
  }
}
```
**Explanation**: This query finds documents that must match both "OpenSearch" in the `title` and "active" in the `status`, and also have an `age` between 25 and 35.

### 5. Wildcard Query
**Purpose**: Find documents with fields matching a wildcard pattern.

```json
{
  "query": {
    "wildcard": {
      "username": "user*"
    }
  }
}
```
**Explanation**: This query searches for documents where the `username` field starts with "user".

### 6. Prefix Query
**Purpose**: Find documents where a field value starts with a specified prefix.

```json
{
  "query": {
    "prefix": {
      "product_code": "ABC"
    }
  }
}
```
**Explanation**: This query finds documents where the `product_code` field starts with "ABC".

### 7. Fuzzy Query
**Purpose**: Find documents that match a term approximately, with a specified level of fuzziness.

```json
{
  "query": {
    "fuzzy": {
      "name": {
        "value": "john",
        "fuzziness": "AUTO"
      }
    }
  }
}
```
**Explanation**: This query finds documents where the `name` field is approximately "john", accounting for possible typos.

### 8. Aggregation Query
**Purpose**: Perform aggregations such as counts, sums, averages, etc.

```json
{
  "aggs": {
    "average_age": {
      "avg": {
        "field": "age"
      }
    }
  }
}
```
**Explanation**: This query calculates the average value of the `age` field across all documents.

### 9. Nested Query
**Purpose**: Query nested objects within documents.

```json
{
  "query": {
    "nested": {
      "path": "comments",
      "query": {
        "bool": {
          "must": [
            { "match": { "comments.author": "John" } },
            { "match": { "comments.message": "great" } }
          ]
        }
      }
    }
  }
}
```
**Explanation**: This query finds documents with nested `comments` where the author is "John" and the message contains "great".

### 10. Script Query
**Purpose**: Use a script to filter documents based on custom logic.

```json
{
  "query": {
    "script": {
      "script": {
        "source": "doc['age'].value > params.minAge",
        "params": {
          "minAge": 25
        }
      }
    }
  }
}
```
**Explanation**: This query filters documents using a custom script that checks if the `age` field is greater than 25.

### Summary

These examples cover a range of common queries you can perform in OpenSearch/Elasticsearch. Depending on your use case, you might combine these queries to filter and retrieve the exact data you need.