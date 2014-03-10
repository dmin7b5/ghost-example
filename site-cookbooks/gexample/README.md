gexample Cookbook
================
The gexample Cookbook sets up a Ghost Ubuntu Virtual Machine for testing everything out before migrating your Wordpress blog.


Requirements
------------

#### packages
- `apt`
- `build-essential`
- `openssh`
- `git`
- `chef-solo-search`
- `sudo`
- `users`
- `nodejs`
- `npm`
- `nginx`
- `runit`

Attributes
----------


Usage
-----
#### gexample::default

Just include `gexample` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[gexample]"
  ]
}
```

License and Authors
-------------------
Authors: Jeff Owens
