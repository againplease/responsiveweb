<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="robotics-section">
    <div class="robotics-overlay">
        <div class="robotics-text">
            <h1 class="animated-text">Department of Robotics and AI</h1>
            <h2 class="animated-text">KMITL</h2>
        </div>
    </div>
</div>

<style>
.robotics-section {
    position: relative;
    width: 100%;
    height: 1000px;
    background-image: url('<%= request.getContextPath() %>/images/robotlab.jpg');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    background-attachment: fixed; /* Enable parallax effect */
    overflow: hidden;
}

.robotics-overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    display: flex;
    justify-content: center;
    align-items: center;
    transition: background-color 0.3s ease; /* Smooth overlay transition */
}

/*.robotics-overlay:hover {
    background-color: rgba(0, 0, 0, 0.7);  Darken overlay on hover 
}*/

.robotics-text {
    text-align: center;
    color: white;
}

.robotics-text h1 {
    font-size: 45px;
    font-weight: bold;
    margin-bottom: 10px;
    text-transform: uppercase;
    opacity: 0; /* Start hidden for animation */
    transform: translateX(-50px); /* Start off-screen to the left */
    transition: opacity 0.8s ease, transform 0.8s ease; /* Smooth animation */
}

.robotics-text h2 {
    font-size: 48px;
    font-weight: bold;
    color: #e35205;
    text-transform: uppercase;
    opacity: 0; /* Start hidden for animation */
    transform: translateX(50px); /* Start off-screen to the right */
    transition: opacity 0.8s ease, transform 0.8s ease; /* Smooth animation */
    transition-delay: 0.2s; /* Slight delay for staggered effect */
}

/* Class to trigger animation when in view */
.robotics-text h1.in-view,
.robotics-text h2.in-view {
    opacity: 1;
    transform: translateX(0); /* Slide to original position */
}

/* Responsive adjustments */
@media screen and (max-width: 768px) {
    .robotics-section {
        height: 400px;
        background-attachment: scroll; /* Disable parallax on mobile for better performance */
    }
    .robotics-text h1 {
        font-size: 36px;
    }
    .robotics-text h2 {
        font-size: 36px;
    }
}

@media screen and (max-width: 480px) {
    .robotics-section {
        height: 300px;
        background-attachment: scroll; /* Disable parallax on mobile */
    }
    .robotics-text h1 {
        font-size: 28px;
    }
    .robotics-text h2 {
        font-size: 28px;
    }
}
</style>

<script>
// Parallax effect (optional, already handled by CSS background-attachment: fixed)

// Scroll animation for text
document.addEventListener('DOMContentLoaded', () => {
    const roboticsSection = document.querySelector('.robotics-section');
    const textElements = document.querySelectorAll('.animated-text');

    function checkVisibility() {
        const rect = roboticsSection.getBoundingClientRect();
        const windowHeight = window.innerHeight;

        // Check if the section is in the viewport
        if (rect.top <= windowHeight * 0.8 && rect.bottom >= 0) {
            textElements.forEach(element => {
                element.classList.add('in-view');
            });
        }
    }

    // Run on scroll and initially
    window.addEventListener('scroll', checkVisibility);
    checkVisibility();
});
</script>