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
                //set that we want both audio and video
                const constraints = {
                    video: true,
                    audio: true
                };

                //start recording
                navigator.mediaDevices.getUserMedia(constraints)
                    .then(this.handleSuccess.bind(this))
                    .catch(this.handleFailure);
            },
            handleFailure: function(error){
                //if they don't have browser support, try a lower compatibility function or fail
                console.error('Reeeejected!', error);
            },
            handleSuccess: function(stream){
                const video = document.querySelector('video');
                const downloadLink = document.getElementById('download');

                const recordedChunks = [];
                let audioStream = stream.getTracks()[0];
                let videoStream = stream.getTracks()[1];

                //initialize and display recording stream
                const mediaRecorder = new MediaRecorder(stream);
                video.srcObject = stream;

                //start recording when video is loaded
                video.addEventListener('loadeddata', function(){
                    mediaRecorder.start(3000);
                })

                //set local variable to set correct scope
                let appScope = this;

                //save data as it becomes available. Stop recording if stop button has been triggered
                mediaRecorder.addEventListener('dataavailable', function(e) {
                    if (e.data.size > 0) {
                        recordedChunks.push(e.data);
                    }
                    if(appScope.recording == false) {
                        mediaRecorder.stop();
                    }
                });

                //when recording stops, save the video object and stop displaying video stream
                mediaRecorder.addEventListener('stop', function() {
                    audioStream.stop();
                    videoStream.stop();
                    downloadLink.href = URL.createObjectURL(new Blob(recordedChunks));
                    downloadLink.download = 'acetest.webm';
                    axios
                        .post(
                            "/saveFile",
                            {
                                note: this.note,
                                user: this.$store.state.user.id,
                            }
                        )
                        .then(r => console.log(r))
                        .catch(e => console.log(e));
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