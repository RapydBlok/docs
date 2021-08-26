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

API authentication requires a bearer access token and three data items. The following examples us cURL, Python and Postman.

```yaml
# Required Data Fields
{
    "domain": "domainname.com",
    "emailAddress": "",
    "sendMail": false
}
```

### Search previews

A search result can contain previews that show where the search words are found in the specific section.

```yaml
# Example using cURL
# rapydblok.com is scanned and results are emailed to admin[@]rapydblok.com
curl --location --request POST 'https://api.rapydblok.com/subdomain' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer ADDCUSTOMTOKEN' \
--data-raw '{
    "domain": "rapydblok.com",
    "emailAddress": "admin@rapydblok.com",
    "sendMail": true
}'
```

### Search tokenizer

The default is for hyphens to separate tokens in search terms:
`gem-based` is equivalent to `gem based`, matching either word.
To allow search for hyphenated words:

```yaml
# Set the search token separator
# Default: /[\s\-/]+/
# Example: enable support for hyphenated search words
search.tokenizer_separator: /[\s/]+/
```

### Display URL in search results 

```yaml
# Display the relative url in search results
# Supports true (default) or false
search.rel_url: false
```

### Display search button

The search button displays in the bottom right corner of the screen and triggers the search input when clicked.

```yaml
# Enable or disable the search button that appears in the bottom right corner of every page
# Supports true or false (default)
search.button: true
```


## Hiding pages from search

Sometimes you might have a page that you don't want to be indexed for the search nor to show up in search results, e.g, a 404 page.
To exclude a page from search, add the `search_exclude: true` parameter to the page's YAML front matter:

#### Example
{: .no_toc }

```yaml
---
layout: default
title: Page not found
nav_exclude: true
search_exclude: true
---
```


## Generate search index when used as a gem

If you use Just the Docs as a remote theme, you do not need the following steps.

If you use the theme as a gem, you must initialize the search by running this `rake` command that comes with `just-the-docs`:

```bash
$ bundle exec just-the-docs rake search:init
```

This command creates the `assets/js/zzzz-search-data.json` file that Jekyll uses to create your search index.
Alternatively, you can create the file manually with [this content]({{ site.github.repository_url }}/blob/master/assets/js/zzzz-search-data.json).