var config = {
    hosts: {
        domain: 'jitsi.example.com',

        muc: 'conference.jitsi.example.com', // FIXME: use XEP-0030
        focus: 'focus.jitsi.example.com',
    },
    disableSimulcast: false,
    resolution: 1080,
    externalConnectUrl: '//jitsi.example.com/http-pre-bind',
    analyticsScriptUrl: "https://jitsi.example.com/libs/analytics.min.js",
    useStunTurn: false, // use XEP-0215 to fetch STUN and TURN server
    useIPv6: false, // ipv6 support. use at your own risk
    useNicks: false,
    bosh: '//jitsi.example.com/http-bind', // FIXME: use xep-0156 for that
    etherpad_base: 'https://jitsi.example.com/etherpad/p/',
    clientNode: 'http://jitsi.org/jitsimeet', // The name of client node advertised in XEP-0115 'c' stanza

    // Desktop sharing is set to false since it requires an extension built for an specific domain
    desktopSharing: 'false', // Desktop sharing method. Can be set to 'ext', 'webrtc' or false to disable.
    chromeExtensionId: 'diibjkoicjeejcmhdnailmkgecihlobk', // Id of desktop streamer Chrome extension
    desktopSharingSources: ['screen', 'window'],
    minChromeExtVersion: '0.1.3', // Required version of Chrome extension
    desktopSharingFirefoxExtId: "",
    desktopSharingFirefoxDisabled: true,
    desktopSharingFirefoxMaxVersionExtRequired: 0,
    desktopSharingFirefoxExtensionURL: "",
    useRoomAsSharedDocumentName: false,
    enableRtpStats: false, // Enables RTP stats processing
    openSctp: true, // Toggle to enable/disable SCTP channels
    channelLastN: -1, // The default value of the channel attribute last-n.
    minHDHeight: 540,
    startBitrate: "800",
    adaptiveLastN: false,
    disableAudioLevels: false,
    useRtcpMux: true,
    useBundle: true,
    disableAdaptiveSimulcast: true,
    enableLipSync: true,
    stereo: false,
    enableTalkWhileMuted: true,
    hiddenDomain: 'recorder.jitsi.example.com',
    enableRecording: true,
    requireDisplayName: false,
    recordingType: 'jibri',
    enableWelcomePage: true,
    isBrand: false,
    logStats: true,
    // To enable sending statistics to callstats.io you should provide Applicaiton ID and Secret.
    // callStatsCustomScriptUrl: "https://api.callstats.io/static/callstats-ws.min.js",
    // callStatsID: "347489791", //Application ID for callstats.io API
    // callStatsSecret: "169aw6v+hk9TbVuHN2SiDCgfkkU=", //Secret for callstats.io API
    startAudioMuted: 9,
    startVideoMuted: 9,
    enableUserRolesBasedOnToken: false,
};