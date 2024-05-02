# Kernel patches updater.

This is a simple rust binary that when executed, will look inside of `applied-patches`
for patches that you have cherry-picked from `sirlucjan/kernel-patches` (provided here
inside `git`). The structure is setup to be compatible with the TKG kernel, with
slight modifications. Every patch must end in `.patch`, but you can just drop the
patches in the `applied-patches` repo, like you would `linux<ver>-tkg-userpatches`.

This will then crawl the `sirlucjan/kernel-patches` repo for the applied patches
and copy all patches related to the inputed patches, including all versions
in their appropriate folders, allowing you to cherry-pick your patches accordingly.
