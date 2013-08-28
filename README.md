watcher Cookbook
================
This cookbook installs and configures the Python Watcher daemon (https://github.com/greggoryhz/Watcher), which uses
the inotify kernel subsystem to monitor for file system changes and perform arbitrary actions.

Requirements
------------
Platform
--------

* Red Hat, CentOS - I will be working on Debian support as I have a system that needs it!

#### cookbooks
- `git` - needed to clone the latest version of the tool.
- `python` - required for installing python dependencies and to execute the tool.

Attributes
----------

#### watcher::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['watcher']['repo_url']</tt></td>
    <td>String</td>
    <td>The Git repository to clone the daemon from.</td>
    <td><tt>https://github.com/greggoryhz/Watcher.git</tt></td>
  </tr>
  <tr>
    <td><tt>['watcher']['branch']</tt></td>
    <td>String</td>
    <td>The branch or commit to checkout and use.</td>
    <td><tt>master</tt></td>
  </tr>
  <tr>
    <td><tt>['watcher']['install_path']</tt></td>
    <td>String</td>
    <td>Destination for the cloned tool.</td>
    <td><tt>/usr/local/watcher</tt></td>
  </tr>
  <tr>
    <td><tt>['watcher']['jobs']</tt></td>
    <td>Array</td>
    <td>A set of jobs for the Watcher daemon to manage.</td>
    <td><tt>[]</tt></td>
  </tr>
</table>

Usage
-----
#### watcher::default
e.g.
Just include `watcher` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[watcher]"
  ]
}
```

Resources/Providers
===================

This cookbook's resources are for other cookbooks to manage jobs for the daemon.

`job`
----------

Manage jobs on the server.

### Actions

- :create: create a job 

### Attribute Parameters

- name: name attribute. Name of the job.
- label: description of the task.
- path: file system path to monitor.
- exclude: an array of sub-directories to ignore.
- monitor: file system events to monitor (create, move_to, delete, etc.).
- recursive: should the path be monitored recursively?
- command: the command to be executed following a detected event.

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Peter Green
