<template>
    <div id="record-message">
        <video id="record_video" poster="/img/videocall/video-placeholder.jpg" autoplay muted="muted">
            <source src="/video/record.mp4" type="video/mp4">
        </video>
    </div>
</template>

<script>
    import { mapActions } from 'vuex'

    export default {
        props: ['recording', 'clickedCharacter'],
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
            handleSuccess: function(stream) {
                const video = document.querySelector('video');

                const recordedChunks = [];
                let audioStream = stream.getTracks()[0];
                let videoStream = stream.getTracks()[1];

                //initialize and display recording stream
                const mediaRecorder = new MediaRecorder(stream);
                video.srcObject = stream;

                //start recording when video is loaded
                video.addEventListener('loadeddata', function () {
                    mediaRecorder.start(3000);
                })

                //set local variable to set correct scope
                let appScope = this;

                //save data as it becomes available. Stop recording if stop button has been triggered
                mediaRecorder.addEventListener('dataavailable', function (e) {
                    if (e.data.size > 0) {
                        recordedChunks.push(e.data);
                    }
                    if (appScope.recording == false) {
                        mediaRecorder.stop();
                    }
                });

                //when recording stops, save the video object and stop displaying video stream
                mediaRecorder.addEventListener('stop', function () {
                    audioStream.stop();
                    videoStream.stop();

                    //save the recorded data to a blob, and give it a url
                    const blob = new Blob(recordedChunks, {type: 'video/webm'});
                    var href = URL.createObjectURL(new Blob(recordedChunks), {type: 'video/webm'});

                    appScope.saveVideoMessage(blob, href);
                })
            },
            saveVideoMessage: function(blob, href){
                //append all needed information into a form
                let data = new FormData();
                data.append('user', this.$store.state.user.id);
                data.append('character', this.clickedCharacter);

                //fetch the data saved into the blob
                axios
                    .get(
                        href,
                        { responseType: 'blob'}
                    ).then(function (response) {
                    //read in data from saved blob url
                    var reader = new FileReader();
                    reader.readAsDataURL(response.data, {type: 'application/octet-stream'});
                    reader.onloadend = function () {
                        var base64data = reader.result;
                        //append blob data to the form
                        data.append('blob', base64data);
                        //submit form with all needed data
                        axios
                            .post(
                                "/saveFile",
                                data
                            )
                            .then(r => console.log(r))
                            .catch(e => console.log(e));
                    };
                })
            }
        }
    }

</script>

<style scoped>
    #record_video{
        height: 27rem;
        width: 100%;
    }


</style>