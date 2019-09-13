{ stdenv, fetchzip, jre, hadoop }:

let
  sha256 = "1g4y3378y2mwwlmk5hs1695ax154alnq648hn60zi81i83hbxy5q";
  version = "3.1.2";
in

stdenv.mkDerivation {
  name = "hive";
  inherit version;
  src = fetchzip {
    inherit sha256;
    url = "mirror://apache/hive/hive-${version}/apache-hive-${version}-bin.tar.gz";
  };
 
  installPhase = ''
    mv * $out/bin/
    export JAVA_HOME="${jre}"
    export HADOOP_HOME="${hadoop}"
  ''; 

}

