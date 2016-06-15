var config = {
    hosts: {
        domain: 'jitsi.example.com',
        muc: 'conference.jitsi.example.com',
        bridge: 'jitsi-videobridge.jitsi.example.com'
    },
    useNicks: false,
    bosh: '//jitsi.example.com/http-bind', // FIXME: use xep-0156 for that
    desktopSharing: 'ext' // Desktop sharing method. Can be set to 'ext', 'webrtc' or false to disable.
    minHDHeight: 540,
    startBitrate: "800",
    resolution: 1080,
    useRtcpMux: true,
    useBundle: true,
    enableLipSync: true,
    openSctp: true, // Toggle to enable/disable SCTP channels
    channelLastN: -1, // The default value of the channel attribute last-n.
    //chromeExtensionId: 'diibjkoicjeejcmhdnailmkgecihlobk', // Id of desktop streamer Chrome extension
    //minChromeExtVersion: '0.1' // Required version of Chrome extension
};
