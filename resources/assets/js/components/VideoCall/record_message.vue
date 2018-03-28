<template>
    <div id="record-message">
        <video id="record_video" poster="/img/videocall/video-placeholder.jpg" autoplay>
            <source src="/video/record.mp4" type="video/mp4">
        </video>
        <a id="download">Download</a>
    </div>
</template>

<script>
    import { mapActions } from 'vuex'

    export default {
        props: ['recording'],
        watch:{
           recording: function(){
               if(this.recording){
                   this.leaveMessage();
               }
           }
        },
        methods: {
            leaveMessage: function(){
                function hasGetUserMedia() {
                    return !!(navigator.mediaDevices && navigator.mediaDevices.getUserMedia);
                }

                function fallback(error) {
                    console.error('Reeeejected!', error);
                    video.src = 'fallbackvideo.webm';
                }

                const constraints = {
                    video: true,
                    audio: true
                };
                if (hasGetUserMedia()) {
                    navigator.mediaDevices.getUserMedia(constraints).
                    then(this.handleSuccess.bind(this)).catch(fallback);
                } else {
                    fallback();
                }
            },
            handleSuccess: function(stream){
                const video = document.querySelector('video');
                const downloadLink = document.getElementById('download');
                let that = this;
                const recordedChunks = [];
                var audioStream = stream.getTracks()[0];
                var videoStream = stream.getTracks()[1];
                const mediaRecorder = new MediaRecorder(stream);
                video.srcObject = stream;

                video.addEventListener('loadeddata', function(){
                    mediaRecorder.start(3000);
                })

                mediaRecorder.addEventListener('dataavailable', function(e) {
                    if (e.data.size > 0) {
                        recordedChunks.push(e.data);
                    }
                    if(that.recording == false) {
                        mediaRecorder.stop();
                    }
                });

                mediaRecorder.addEventListener('stop', function() {
                    downloadLink.href = URL.createObjectURL(new Blob(recordedChunks));
                    downloadLink.download = 'acetest.webm';
                    audioStream.stop();
                    videoStream.stop();
                });

            },
        }
    }

</script>

<style scoped>
    #record_video{
        height: 40rem;
        width: 100%;
    }


</style>