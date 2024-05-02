#!/bin/bash

REPO_PATH="/STORAGE/kernel-patches/git"
CURRENT_PATCHES_PATH="/STORAGE/kernel-patches/applied-patches"
NEW_PATCHES_FOLDER="/STORAGE/kernel-patches/updated-patches"

echo "Available kernel versions:"
available_versions=()
for version_folder in "$REPO_PATH"/*; do
    if [ -d "$version_folder" ] && [ "$version_folder" != "$REPO_PATH/.git" ]; then
        version=$(basename "$version_folder")
        available_versions+=("$version")
        echo " - $version"
    fi
done

read -p "Enter the version you want to choose patches from: " selected_version
valid_version=false
for version in "${available_versions[@]}"; do
    if [ "$selected_version" == "$version" ]; then
        valid_version=true
        break
    fi
done

if [ "$valid_version" == false ]; then
    echo "Invalid version selected."
    exit 1
fi

for patch_file in "$CURRENT_PATCHES_PATH"/*.patch; do
    patch_name=$(basename "$patch_file" .patch)
    echo "Searching for directories containing patches for $patch_name in version $selected_version..."
    found_dirs=$(find "$REPO_PATH/$selected_version" -type f -name "$patch_name" -exec dirname {} \; | sort -u)
    if [ -n "$found_dirs" ]; then
        for found_dir in $found_dirs; do
            cp -r "$found_dir" "$NEW_PATCHES_FOLDER"
            echo "Copied directory $found_dir containing patches for $patch_name to $NEW_PATCHES_FOLDER"
        done
    else
        echo "Directories containing patches for $patch_name not found in version $selected_version."
    fi
done
