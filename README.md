ssh_known_hosts2: enhanced functionality for editing SSH's known_hosts files
--------------------------------------------------------------------------------

This cookbook currently provides a single provider: `ssh_known_hosts2_edit`
which edits, and **does not template** a `known_hosts` file. It does this by
organizing the file into memory and overwriting it in a consistent way, but
preserves all data in the file that already existed.

Provider Information
--------------------------------------------------------------------------------

Actions: `modify` and `delete` do pretty much what you think they do.

Attributes:

* `host`: name attribute. can be a String or an Array of hosts you'd like to
  associate with this key.
* `key`: the string content of the host key. **required**.
* `filename`: The filename you wish to edit. The default is `/root/.ssh/known_hosts`.
* `owner`: the owner of the file. be sure to pair this with `group` and `filename`.
* `group`: the group of the file.

Contributing
--------------------------------------------------------------------------------

* Fork the project
* Make your edits
* Be sure to not change anything in metadata.rb without prior permission.
* Send a pull request.

Author
--------------------------------------------------------------------------------

Erik Hollensbe <erik+chef@hollensbe.org>
