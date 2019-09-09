{ lib, ... }:

with lib;

{
  options.system.holoportos = {
    target = mkOption {
      default = "generic";
    };
  };
}
