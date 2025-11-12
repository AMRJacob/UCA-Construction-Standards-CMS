---
layout: none
---
[
  {% for page in site.pages %}
    {% if page.title %}
    {
      "title"    : "{{ page.title | escape }}",
      "url"      : "{{ site.baseurl }}{{ page.url }}",
      "category" : "{{ page.category | default: 'General' }}",
      "content"  : "{{ page.content | strip_html | strip_newlines | escape }}"
    }{% unless forloop.last %},{% endunless %}
    {% endif %}
  {% endfor %}
]