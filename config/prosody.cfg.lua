VirtualHost "jitsi.example.com"
    authentication = "anonymous"
    ssl = {
        key = "/keys/jitsi.example.com.key";
        certificate = "/keys/jitsi.example.com.crt";
    }
    modules_enabled = {
        "bosh";
        "pubsub";
    }

VirtualHost "auth.jitsi.example.com"
    authentication = "internal_plain"

admins = { "focus@auth.jitsi.example.com" }
cross_domain_bosh = true;
component_ports = { 5347 }

Component "conference.jitsi.example.com" "muc"
Component "jitsi-videobridge.jitsi.example.com"
    component_secret = "YOURSECRET1"
Component "focus.jitsi.example.com"
    component_secret = "YOURSECRET2"
