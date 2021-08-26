---
layout: default
title: Home
nav_order: 1
description: "RapydBlok.com documentation repository"
permalink: /
---

# RapydBlok.com Official Documentation Repository

RapydBlok.com, is a SaaS, Cyber Security company that offers free SSL Auditing and SubDomain Discovery webapps, with commercial API's.

[Get started now](#getting-started){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 } [View it on GitHub](https://github.com/RapydBlok/rapydblok.github.io)

---

## Getting started

### API
RapydBlok.com offers a free webapp for SSL Auditing called [RapdyBlok INSPECT](https://inspect.rapydblok.com) and a free webapp for SubDomain Discovery called [RapdyBlok DISCOVER](https://discover.rapydblok.com).

Both the <b>INSPECT</b> and <b>DISCOVER</b> webapps offer commercial API's.

### Quick start: Use as a GitHub Pages remote theme

1. Add Just the Docs to your Jekyll site's `_config.yml` as a [remote theme](https://blog.github.com/2017-11-29-use-any-theme-with-github-pages/)
```yaml
remote_theme: pmarsceill/just-the-docs
```
<small>You must have GitHub Pages enabled on your repo, one or more Markdown files, and a `_config.yml` file. [See an example repository](https://github.com/pmarsceill/jtd-remote)</small>

---

## About the project

Just the Docs is &copy; 2017-{{ "now" | date: "%Y" }} by [Patrick Marsceill](http://patrickmarsceill.com).

### License

Just the Docs is distributed by an [MIT license](https://github.com/pmarsceill/just-the-docs/tree/master/LICENSE.txt).

### Contributing

When contributing to this repository, please first discuss the change you wish to make via issue,
email, or any other method with the owners of this repository before making a change. Read more about becoming a contributor in [our GitHub repo](https://github.com/pmarsceill/just-the-docs#contributing).

#### Thank you to the contributors of Just the Docs!

<ul class="list-style-none">
{% for contributor in site.github.contributors %}
  <li class="d-inline-block mr-1">
     <a href="{{ contributor.html_url }}"><img src="{{ contributor.avatar_url }}" width="32" height="32" alt="{{ contributor.login }}"/></a>
  </li>
{% endfor %}
</ul>
