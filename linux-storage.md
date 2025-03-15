Yes, that's a correct general process for managing storage in Linux. Here's a breakdown of each step:

1. **Attach Devices to a Computer:**
   - This involves physically connecting or making available storage devices to the computer. These devices can include hard drives, solid-state drives, or virtual devices.

2. **Create Volumes from Devices:**
   - After attaching the devices, you need to create volumes on them. A volume is a logical storage unit that can span one or more physical devices. In Linux, you might use tools like `fdisk` or `parted` to create partitions on the storage devices.

3. **Format a Volume to a Specific File System:**
   - Once you have created a volume, you need to format it with a specific file system. Common file systems in Linux include ext4, XFS, and others. The `mkfs` command is often used for this purpose. For example:
     ```bash
     mkfs -t ext4 /dev/sdX1
     ```
     Replace `/dev/sdX1` with the actual device and partition you are formatting.

4. **Mount the Volume to a Path in the OS:**
   - After formatting, you need to mount the volume to make it accessible to the operating system. You specify a mount point (a directory) where the contents of the volume will be made available. The `mount` command is used for this. For example:
     ```bash
     mount /dev/sdX1 /mnt/mydata
     ```
     This mounts the volume located at `/dev/sdX1` to the directory `/mnt/mydata`.

Additionally, to make the mount persistent across reboots, you would typically update the `/etc/fstab` file with the relevant information.

This process is foundational in Linux storage management and is essential for tasks like adding new disks, creating file systems, and managing data storage on a Linux system.