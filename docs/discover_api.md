---
layout: default
title: Discover API
nav_order: 2
---

# RapydBlok Discover API
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

[RapydBlok DISCOVER](http://discover.rapydblok.com) has a commercial (paid) API that can gather SubDomain information. The following will document the DISCOVER API in detail.

## Authorization

- Request Access token & Pricing: Email admin[@]rapydblok.com
- RapydBlok Discover API URL: https://api.rapydblok.com/subdomain

A bearer access token is required from RapydBlok to access the DISCOVER API, otherwise an error like the below, will be shown. Note: Access tokens have a finite lifetime and defined in commercial process.

```yaml
{"status":false,"message":"You are not authorized to access this method"}
```

## Authentication

API authentication requires a bearer access token and a query, three data items to run a scan.
```yaml
# Required Data Fields
# Domain: Top-Level domains only.
# EmailAddress: Enter email address. 'Note:' Email address should match the domain being scanned.
# SendMail: true or false.
```
```bash
{
    "domain": "domainname.com",
    "emailAddress": "",
    "sendMail": false
}
```
The following examples use cURL, Python and Postman.

### Example Query using cURL
```yaml
# Example using cURL
# rapydblok.com is scanned and results are emailed to admin[@]rapydblok.com.
# Replace 'ADDCUSTOMTOKEN' with custom token supplied by RapydBlok.
```
```bash
curl --location --request POST 'https://api.rapydblok.com/subdomain' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer ADDCUSTOMTOKEN' \
--data-raw '{
    "domain": "rapydblok.com",
    "emailAddress": "admin@rapydblok.com",
    "sendMail": true
}'
```

### Example Query using Python

```yaml
# Example using Python
# rapydblok.com is scanned and results are not emailed.
# Replace 'ADDCUSTOMTOKEN' with custom token supplied by RapydBlok.
```
```bash
import requests
import json

url = "https://api.rapydblok.com/subdomain"

payload = json.dumps({
  "domain": "rapydblok.com",
  "emailAddress": "",
  "sendMail": False
})
headers = {
  'Content-Type': 'application/json',
  'Authorization': 'Bearer ADDCUSTOMTOKEN',
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)
```

### Example Query using Postman App

1: Download [Postman](https://www.getpostman.com/) for your environment.<br>
2: In Postman, select the POST method.<br>
3: Enter the https://api.rapydblok.com/subdomain request URL.<br>
4: In Body insert the required data fields;<br>
```bash
{
    "domain": "rapydblok.com",
    "emailAddress": "",
    "sendMail": false
}
```

5: In Authorization section, select ```bash Bearer Token ``` and insert the token supplied by RapydBlok into the field.<br>
6: Click Send to run the query, the domain should start to scan and results returned.<br>
