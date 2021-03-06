DESCRIPTION
===========

Installs the libfdk-aac ("Fraunhofer FDK AAC code from Android") - [GitHub](https://github.com/mstorsjo/fdk-aac)

Difference: Added the compile flags.
Requirements
============

* Chef 0.10
* Ubuntu 10.04

Please help increase the supported platform list by notifying me or submitting pull requests which will add support for other platforms.

Attributes
==========

* `libfdk-aac[:install_method]` - Installation method, `:source` or `:package` - default `:source`
* `libfdk-aac[:git_repository]` - Location of the source Git repository if installing via `:source`
* `libfdk-aac[:git_revision]` - Revision of the Git repository to install if installing via `:source`.
* `libfdk-aac[:prefix]` - Location prefix of where the installation files will go if installing via `:source`

WARN: When specifying the `git_revision` attribute, use the hash of commit or a HEAD - not a tag. Sync action of Git provider will always attempt to update the git clone if a tag is used.

Development
===========

* Source hosted at [GitHub](https://github.com/anentropic/libfdk-aac-cookbook)
* Report issues/Questions/Feature requests on [GitHub Issues](https://github.com/anentropic/libfdk-aac-cookbook/issues)

Pull requests are very welcome! Make sure your patches are well tested.
Ideally create a topic branch for every separate change you make.

LICENSE and AUTHOR
==================

### Based on [libvpx-cookbook](https://github.com/enmasse-entertainment/libvpx-cookbook) by:

Author:: Jamie Winsor (<jamie@vialstudios.com>)

Copyright:: 2011, En Masse Entertainment, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
