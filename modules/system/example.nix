{ lib, ... }:

with lib;

{
  options.system.example = {
    target = mkOption {
      default = "generic";
    };
  };
}
