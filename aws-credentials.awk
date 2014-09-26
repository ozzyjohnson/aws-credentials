BEGIN {
   FS=",";
   home = ENVIRON["HOME"];
   credentials = home "/.aws/credentials";
   config = home "/.aws/config";
   region = "us-east-1";
   output = "json";
}

NR > 1 {
    gsub(/"/, "", $1);
    printf "\n[%s]\naws_access_key_id = %s\naws_secret_access_key = %s\n",
            $1, $2, $3 \
            >> credentials;

    printf "\n[profile %s]\noutput=%s\nregion=%s\n",
            $1, output, region \
            >> config;
}
