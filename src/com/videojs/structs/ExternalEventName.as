package com.videojs.structs{
    
    public class ExternalEventName{
        
        public static const ON_SRC_CHANGE:String = "onsrcchange";
        public static const ON_LOAD_START:String = "loadstart";
        public static const ON_START:String = "playing";
        public static const ON_PAUSE:String = "pause";
        public static const ON_RESUME:String = "play";
        public static const ON_SEEK_START:String = "seeking";
        public static const ON_SEEK_COMPLETE:String = "seeked";
        public static const ON_BUFFER_FULL:String = "loadeddata";
        public static const ON_BUFFER_EMPTY:String = "waiting";
        public static const ON_BUFFER_FLUSH:String = "emptied";
        public static const ON_PLAYBACK_COMPLETE:String = "ended";
        public static const ON_METADATA:String = "loadedmetadata";
        public static const ON_DURATION_CHANGE:String = "durationchange";
        public static const ON_CAN_PLAY:String = "canplay";
        public static const ON_CAN_PLAY_THROUGH:String = "canplaythrough";
        public static const ON_VOLUME_CHANGE:String = "volumechange";
        
        public static const ON_RTMP_CONNECT_SUCCESS:String = "rtmpconnected";
        public static const ON_RTMP_RETRY:String = "rtmpretry";
        public static const ON_STAGE_CLICK:String = "stageclick";
        public static const ON_LEVEL_SWITCH:String = "levelswitch";

        /**
         * Source Modify by Zhao Yang 增加事件load level
         */
        public static const ON_LEVEL_LOAD:String = "levelswitched";

        /**
         * Source Modify by Zhao Yang 增加事件获取每一片速度
         */
        public static const ON_NETWORK_SPEED:String = "networkspeed";

        /**
         * Source Modify by Zhao Yang 增加双击事件
         */
        public static const ON_DOUBLE_CLICK:String = "dblclick";
        
    }
}