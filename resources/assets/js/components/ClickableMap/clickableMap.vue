<template>
    <div id="videocall" class="container">

        <div class="modal fade" id="pigModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Dead Pig</h4>
                    </div>
                    <div class="modal-body">
                        <img src="/img/scene/DeadPig.png" style="width: 100%;">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="incidentReportModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Incident Report</h4>
                    </div>
                    <div class="modal-body">
                        <img src="/img/scene/IncidentReport.png" style="width: 100%;">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="computerScreenModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Test Results</h4>
                    </div>
                    <div class="modal-body">
                        <img src="/img/scene/MCAnimalTestCS.png" style="width: 100%">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="testResultsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Test Results</h4>
                    </div>
                    <div class="modal-body">
                        <img src="/img/scene/Clipboard.png" style="width: 100%">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="whiteboard1Modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Test Notes</h4>
                    </div>
                    <div class="modal-body">
                        <img src="img/scene/Note.png" style="width: 100%">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>




        <div class="row">
            <img id="Image-Maps-Com-image-maps-2016-10-04-135016" src="/img/scene/SmallPigProblems.jpg" border="1" width="1249" height="909" orgWidth="1249" orgHeight="909" usemap="#image-maps-2016-11-01-111008" alt="" />
            <!-- <map name="image-maps-2016-10-04-135016" id="ImageMapsCom-image-maps-2016-10-04-135016">
            <area shape="rect" coords="1247,907,1249,909" alt="Image Map" style="outline:none;" title="Image Map" href="http://www.image-maps.com/index.php?aff=mapped_users_0" />
            <area id="deadPig" alt="" title=""  data-toggle="modal" data-target="#pigModal" shape="poly" coords="265,588,217,603,181,602,142,609,121,618,89,630,57,639,49,639,56,626,46,626,23,627,29,615,35,602,47,589,53,573,58,561,63,545,71,535,78,544,84,552,115,539,137,530,172,528,191,528,208,527,224,524,242,519,265,523,277,531,289,539,294,551,294,562,294,576,286,584,278,588" style="outline:none;" target="_self"     />
            <area id="computerScreen" alt="" title="" data-toggle="modal" data-target="#computerScreenModal" shape="poly" coords="263,274,267,336,336,332,333,273" style="outline:none;" target="_self"     />
            <area id="incidentReport" alt="" title="" data-toggle="modal" data-target="#incidentReportModal" shape="poly" coords="801,440,836,448,868,441,832,433" style="outline:none;" target="_self"     />
            <area id="whiteboard1" alt="" title="" data-toggle="modal" data-target="#whiteboard1Modal" shape="poly" coords="997,164,999,417,1063,405,1068,175" style="outline:none;" target="_self"     />
            <area id="whiteboard2" alt="" title="" data-toggle="modal" data-target="#whiteboard2Modal" shape="poly" coords="669,254,672,343,746,339,744,258" style="outline:none;" target="_self"     />
            <area id="testResults" alt="" title="" data-toggle="modal" data-target="#testResultsModal" shape="poly" coords="1111,310,1111,369,1153,365,1153,312" style="outline:none;" target="_self"     />
        </map> -->

            <map name="image-maps-2016-11-01-111008" id="ImageMapsCom-image-maps-2016-11-01-111008">
                <area shape="rect" coords="1247,907,1249,909" alt="Image Map" title="Image Map" href="http://www.image-maps.com/index.php?aff=mapped_users_75936" />
                <area id="deadPig" alt="" title=""  data-toggle="modal" data-target="#pigModal" shape="poly" coords="265,588,217,603,181,602,142,609,121,618,89,630,57,639,49,639,56,626,46,626,23,627,29,615,35,602,47,589,53,573,58,561,63,545,71,535,78,544,84,552,115,539,137,530,172,528,191,528,208,527,224,524,242,519,265,523,277,531,289,539,294,551,294,562,294,576,286,584,278,588" style="outline:none;" target="#pigmodal"     />
                <area  alt="White Board" title="whiteBoard1" shape="poly" coords="992,159,995,418,1063,406,1066,173" target="_self"   data-toggle="modal" data-target="#whiteboard1Modal"  />
                <area  alt="Computer" title="Computer" shape="poly" coords="265,272,268,333,330,330,329,273" target="_self"    data-toggle="modal" data-target="#computerScreenModal" />
                <area  alt="Incident Report" title="IncidentReport" shape="poly" coords="798,437,837,449,869,442,834,432" target="_self"   data-toggle="modal" data-target="#incidentReportModal"  />
                <area  alt="Clipboard Report" title="Clipboard" shape="poly" coords="1112,310,1111,366,1153,367,1154,312" target="_self"  data-toggle="modal" data-target="#testResultsModal"   />
            </map>
        </div>
    </div>
</template>

<script>
    import { mapActions } from 'vuex'
    import imageMapResizer from 'image-map-resizer'

    export default {
        mounted() {
            $('map').imageMapResize();
        },
        props: {

        },
        methods: {

        }
    }
</script>

<style scoped>
    img {
        height: 100%;
        width: 100%;
    }

</style>