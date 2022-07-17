<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to UpdateAssistant</title>
</head>
<body>

<g:render template="/common/header" />
<div class="svg" role="presentation">
    <div class="">
    </div>
</div>

<div id="content" role="main">
    <div class="container">
        <section class="row colset-2-its">
            <h1>Welcome to Update Assistant</h1>
        </section>
         <div role="navigation">
            <div id="device">
                <g:link class="custom-btn btn-9" controller="Device">Devices</g:link>
            </div>
            <div id="updateprocess">
                <g:link class="custom-btn btn-9" controller="UpdateProcess">UpdateProcesses</g:link>
               <!-- <a href="/updateProcess/getUpdateProcessList?deviceId=0" class="custom-btn btn-9" >UpdateProcesses</a> -->
            </div>
         </div>
    </div>
</div>
<style>
#device{
    margin-top:15px;
    text-align: center;
}
#updateprocess{
    margin-top:15px;
    text-align: center;
}
.custom-btn {
  width: 400px;
  height: 80px;
  padding: 25px;
  border: 2px solid #2559a7;
  text-align: center;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
  text-decoration: none;
  font-size: 20px;
}
.btn-9 {
  z-index: 2;
  transition: all 0.3s ease;
  overflow: hidden;
}
.btn-9:after {
  position: absolute;
  content: " ";
  z-index: -1;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  transition: all 0.3s ease;
}
.btn-9:hover {
  box-shadow:  4px 4px 6px 0 rgba(255,255,255,.5),
              -4px -4px 6px 0 rgba(116, 125, 136, .2),
    inset -4px -4px 6px 0 rgba(255,255,255,.5),
    inset 4px 4px 6px 0 rgba(116, 125, 136, .3);
  color: #fff;
}
.btn-9:hover:after {
  -webkit-transform: scale(2) rotate(180deg);
  transform: scale(2) rotate(180deg);
  background: #6c8fad;
  box-shadow:  4px 4px 6px 0 rgba(255,255,255,.5),
              -4px -4px 6px 0 rgba(116, 125, 136, .2),
    inset -4px -4px 6px 0 rgba(255,255,255,.5),
    inset 4px 4px 6px 0 rgba(116, 125, 136, .3);
}
</style>
</body>
</html>
