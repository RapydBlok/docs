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

- Request Access token & Pricing: Email ``` admin[@]rapydblok.com ```
- Discover API Request URL: ``` https://api.rapydblok.com/subdomain ```

A bearer access token is required from RapydBlok to access the DISCOVER API, otherwise an error like the below, will be shown. Note: Access tokens have a finite lifetime and defined in commercial process.

```yaml
{"status":false,"message":"You are not authorized to access this method"}
```

## Authentication

API authentication requires a bearer access token and three data items to run a scan.
```yaml
# Required Data Fields
# Domain: Top-Level domains only.
# EmailAddress: Enter email address. 'Note:' Email address should match the domain being scanned.
# SendMail: true or false.
```
Example of Required Data Fields
```bash
{
    "domain": "domainname.com",
    "emailAddress": "",
    "sendMail": false
}
```
Incorrect Bearer Access Token Error: ``` 500 Internal Server Error ```


## Data Field Validation

Domain input is validated, so only Top-Level domains are accepted.
```yaml
# Domain: Top-Level domains only. e.g 'rapydblok.com'
# Domain: Don't insert a subdomain e.g. 'www' or 'https://'
```
Data Field Validation ```400 Bad Request``` Error examples;
```bash
{
    "status": false,
    "message": "Remove https:// from the top level domain",
    "domain": null,
    "lastScanTime": null,
    "activeSubDomains": null,
    "allSortedSubDomains": null,
    "activeSubDomainCount": null,
    "allSortedSubDomainCount": null
}
```
```bash
{
    "status": false,
    "message": "Remove www. from the top level domain",
    "domain": null,
    "lastScanTime": null,
    "activeSubDomains": null,
    "allSortedSubDomains": null,
    "activeSubDomainCount": null,
    "allSortedSubDomainCount": null
}
```
Data Field Validation ```400 Bad Request``` Error when Email address don't match the domain being scanned;
```bash
{
    "status": false,
    "message": "Invalid email address. Email should match the domain being scanned.",
    "domain": null,
    "lastScanTime": null,
    "activeSubDomains": null,
    "allSortedSubDomains": null,
    "activeSubDomainCount": null,
    "allSortedSubDomainCount": null
}
```

## Examples using cURL, Python and Postman.

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
2: In Postman, select the ``` POST ``` method.<br>
3: Enter the ``` https://api.rapydblok.com/subdomain ``` request URL.<br>
4: In Body insert the required data fields;<br>
```bash
{
    "domain": "rapydblok.com",
    "emailAddress": "",
    "sendMail": false
}
```

5: In Authorization section, select ``` Bearer Token ``` and insert the token supplied by RapydBlok into the field.<br>
6: Click Send to run the query, the domain should start to scan and results returned.<br>

## Results

Query results shoud return the following data in standard formats;
```yaml
# status: true or false.
# message: null or error.
# domain: name of the top-level domain scanned.
# lastScanTime: timestamp of scan.
# activeSubDomains: list of Active subdomains.
# allSortedSubDomains: list of All subdomains.
# activeSubDomainCount: count of Active subdomains.
# allSortedSubDomainCount: count of All subdomains.
```
Query Responses;
- ```200 OK ```
- ```400 Bad Request ```
- ```500 Internal Server Error ```

Example of rapydblok.com results;
```bash
{
    "status": true,
    "message": null,
    "domain": "rapydblok.com",
    "lastScanTime": "2021-08-27 14:40:54",
    "activeSubDomains": [
        {
            "subDomain": "https://api.rapydblok.com",
            "code": "302"
        },
        {
            "subDomain": "https://cpanel.rapydblok.com",
            "code": "200"
        },
        {
            "subDomain": "https://cpcalendars.rapydblok.com",
            "code": "301"
        },
        {
            "subDomain": "https://cpcontacts.rapydblok.com",
            "code": "301"
        },
        {
            "subDomain": "https://discover.rapydblok.com",
            "code": "200"
        },
        {
            "subDomain": "https://docs.rapydblok.com",
            "code": "200"
        },
        {
            "subDomain": "https://inspect.rapydblok.com",
            "code": "200"
        },
        {
            "subDomain": "https://mail.rapydblok.com",
            "code": "301"
        },
        {
            "subDomain": "https://rapydblok.com",
            "code": "301"
        },
        {
            "subDomain": "https://webdisk.rapydblok.com",
            "code": "401"
        },
        {
            "subDomain": "https://webmail.rapydblok.com",
            "code": "200"
        },
        {
            "subDomain": "https://www.rapydblok.com",
            "code": "200"
        }
    ],
    "allSortedSubDomains": [
        "api.rapydblok.com",
        "cpanel.rapydblok.com",
        "cpcalendars.rapydblok.com",
        "cpcontacts.rapydblok.com",
        "discover.rapydblok.com",
        "docs.rapydblok.com",
        "inspect.rapydblok.com",
        "mail.rapydblok.com",
        "rapydblok.com",
        "webdisk.rapydblok.com",
        "webmail.rapydblok.com",
        "www.rapydblok.com"
    ],
    "activeSubDomainCount": 12,
    "allSortedSubDomainCount": 12
}
```
