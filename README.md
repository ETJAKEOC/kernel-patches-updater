# Kernel patches updater.

This is a simple project, starting as a failed bash script from ChatGPT.

The goal here, is for the user to put cherry-picked patches in `applied-patches`
and the script will scan through the `git` folder (A link to sirlucjan/kernel-patches)
for the applied patches, and it will output all patches matching that patch name
in a new folder `updated-patches`.

Insinde `updated-patches` will be the `<k-ver>` folder for the verison the user selected.
Inside the `<k-ver>` directory, will exist the patches parent folder, for example;

`applied-patches/0001-amd-6.9-merge-changes-from-dev-tree.patch` would be the inputed patch file to search for.
`git/6.9-rc/amd-pstate-patches/0001-amd-6.9-merge-changes-from-dev-tree.patch` would copy to `updated-patches/6.9-rc/amd-pstate-patches/0001-amd-6.9-merge-changes-from-dev-tree.patch`
`git/6.9-rc/amd-pstate-patches-v2/0001-amd-6.9-merge-changes-from-dev-tree.patch` would copy to `updated-patches/6.9-rc/amd-pstate-patches-v2/0001-amd-6.9-merge-changes-from-dev-tree.patch`

etc. etc. This is the main goal of the project.

Any questions, please feel free to ask. This project does not need to remain in bash, it can be remade in whatever language would accomplish this task easiest.