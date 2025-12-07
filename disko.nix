{
  disko.devices = {
    disk.sd = {
      type = "disk";
      # TODO: get disk UUID
      device = "/dev/sdc";

      content = {
        type = "gpt";
        partitions = {

          FIRMWARE = {
            size = "1024M";
            label = "FIRMWARE";
            type = "0700"; # Microsoft basic data

            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot/firmware";
              mountOptions = [ "noatime" ];
            };
          };

          ESP = {
            size = "1024M";
            label = "ESP";
            type = "EF00"; # EFI System Partition (ESP)

            content = {
              mountpoint = "/boot";
              type = "filesystem";
              format = "vfat";
              mountOptions = [
                "noatime"
                "umask=0077"
              ];
            };
          };

          zfs = {
            size = "100%";
            content = {
              type = "zfs";
              pool = "zroot";
            };
          };
        };
      };
    };

    zpool = {
      zroot = {
        type = "zpool";

        rootFsOptions = {
          compression = "on";
          xattr = "sa";
          acltype = "posixacl";
          mountpoint = "none";
        };

        datasets = {
          "root" = {
            type = "zfs_fs";
            mountpoint = "/";
          };
          "nix" = {
            type = "zfs_fs";
            mountpoint = "/nix";
          };
          "home" = {
            type = "zfs_fs";
            mountpoint = "/home";
          };
          "home/keith" = {
            type = "zfs_fs";
            mountpoint = "/home/keith";
          };
        };
      };
    };
  };
}
