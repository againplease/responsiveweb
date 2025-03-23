<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="facilities-container">
    <div class="facilitiestitle">Our Facilities</div>
    <div class="facilities-list">
        <div class="facility-item">
            <div class="facility-media">
                <img src="<%= request.getContextPath() %>/images/home/robotarm.png" alt="Robotics Lab">
            </div>
            <div class="facility-description">
                <h3>Industrial Robotic Arms</h3>
                <p>Discover the heart of innovation in our laboratory, featuring over five advanced articulated robots from leading brands like ABB and Mitsubishi Electric. Equipped with sophisticated grippers and pneumatic systems, these robots offer hands-on learning experiences from the first year, bridging theory and practice in robotics engineering.</p>
            </div>
        </div>
        <div class="facility-item">
            <div class="facility-media">
                <video autoplay muted loop playsinline>
                    <source src="<%= request.getContextPath() %>/images/home/3dprinter.mp4" type="video/mp4">
                    Your browser does not support the video tag.
                </video>
            </div>
            <div class="facility-description">
                <h3>3D Printer Farm</h3>
                <p>Our 3D Printer Farm extends its utility beyond traditional applications, playing a pivotal role in enhancing the Drawing subject curriculum. Students are not confined to simulations; instead, they bring their designs to life, experiencing the tangible results of their creativity. Additionally, these printers are integral to team projects, especially in the freshman year’s robot competition held in the first semester. This hands-on approach with real-world applications empowers students to explore, innovate, and collaborate, laying a solid foundation in both design and practical engineering from the outset of their academic journey.</p>
            </div>
        </div>
        <div class="facility-item">
            <div class="facility-media">
                <img src="<%= request.getContextPath() %>/images/home/automation.png" alt="Workshop">
            </div>
            <div class="facility-description">
                <h3>Automation Kits</h3>
                <p>Discover our advanced automation sets, a cornerstone of hands-on learning. Equipped with Programmable Logic Controllers (PLCs) and scaled-down machinery models, these sets offer a realistic glimpse into the world of industrial automation. Students engage with real-world scenarios from the start, mastering the intricacies of machine control and automated systems, essential skills for the technologists of tomorrow.</p>
            </div>
        </div>
    </div>
</div>

<style>
.facilities-container {
    position: relative;
    width: 100%;
    padding: 0; /* Remove padding to make it full-width */
    background-color: white; /* Changed to white to match the image */
    text-align: justify; /* Center the title */
    margin-bottom: 50px;
    margin-top: 20px;
}

.facilitiestitle {
    font-size: 30px;
    margin-bottom: 25px;
    font-weight: bold;
    text-align: center;
    padding-top: 20px; /* Add some padding to avoid sticking to the top */
}

.facilities-list {
    width: 100%;
    max-width: 1200px; /* Constrain content width for readability */
    margin: 0 auto;
    display: flex;
    flex-direction: column; /* Stack items vertically */
    gap: 40px; /* Space between items */
    padding: 0 20px; /* Add some padding on the sides */
}

.facility-item {
    display: flex;
    width: 100%;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Existing shadow */
    background-color: #fff; /* White background for the card */
    border-radius: 10px; /* Rounded corners */
}

.facility-media {
    flex: 1;
    height: 400px; /* Fixed height for consistency */
    background-color: #000; /* Fallback background */
}

.facility-media img,
.facility-media video {
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-top-left-radius: 10px; /* Match the container's border-radius */
    border-bottom-left-radius: 10px; /* Match the container's border-radius */
}

.facility-description {
    flex: 1;
    background: #fff;
    padding: 25px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    border-top-right-radius: 10px; /* Match the container's border-radius */
    border-bottom-right-radius: 10px; /* Match the container's border-radius */
}

.facility-description h3 {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 15px;
    color: #333;
}

.facility-description p {
    font-size: 16px;
    color: #666;
    line-height: 1.6;
}

/* Responsive adjustments for the title */
@media (min-width: 1026px) {
    .facilitiestitle {
        font-size: 32px;
    }
}

@media (min-width: 769px) and (max-width: 1025px) {
    .facilitiestitle {
        font-size: 28px;
    }
}

@media (min-width: 481px) and (max-width: 768px) {
    .facilitiestitle {
        font-size: 26px;
    }
    .facilities-container {
        margin-bottom: 25px;
        margin-top: 20px;
    }
}

@media (max-width: 480px) {
    .facilitiestitle {
        font-size: 22px;
    }
}

/* Responsive adjustments for the list */
@media screen and (max-width: 768px) {
    .facility-item {
        flex-direction: column;
    }
    .facility-media,
    .facility-description {
        flex: none;
        width: 100%;
    }
    .facility-media img,
    .facility-media video {
        border-radius: 10px 10px 0 0; /* Adjust border-radius for vertical stack */
    }
    .facility-description {
        border-radius: 0 0 10px 10px; /* Adjust border-radius for vertical stack */
    }
    .facility-description h3 {
        font-size: 20px;
    }
    .facility-description p {
        font-size: 14px;
    }
}

@media screen and (max-width: 480px) {
    .facility-description h3 {
        font-size: 18px;
    }
    .facility-description p {
        font-size: 12px;
    }
    .facility-media,
    .facility-description {
        height: 300px; /* Reduce height on smaller screens */
    }
}
</style>