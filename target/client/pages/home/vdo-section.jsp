<%@ page contentType="text/html; charset=UTF-8" %>
<div class="container">
    <div class="vdotitle">Getting to know more about us</div>
    <div class="video-wrapper">
        <iframe src="https://www.youtube.com/embed/S9dhNJl7d3A" 
            frameborder="0" allowfullscreen></iframe>
    </div>
</div>
    <style>
        .container {
            max-width: 100%;
            margin: auto;
            padding: 20px;
            background-color: lightsalmon;
            text-align: center;
        }
        .vdotitle {
            font-size: 32px;
            font-weight: bold;
            color: white;
            margin-top: 10px; 
            margin-bottom: 30px;
        }
        .video-wrapper {
            position: relative;
            padding-bottom: 56.25%;
            height: 0;
            overflow: hidden;
            max-width: 90%;
            background: white;
            margin: auto; /* Centers the video wrapper */
            display: block; /* Ensures block-level alignment */
        }
        .video-wrapper iframe {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }
        /* Responsive styles */
        @media (min-width: 1026px) {
            .vdotitle { font-size: 32px; } 
        }
        @media (min-width: 769px) and (max-width: 1025px) {
            .vdotitle { font-size: 28px; } 
        }
        @media (min-width: 481px) and (max-width: 768px) {
            .vdotitle { font-size: 26px; }
        }
        @media (max-width: 480px) {
            .vdotitle { font-size: 22px; margin-top: 0px; margin-bottom: 0px; padding:20px }
            .container {padding: 0px;}
        }
    </style>
