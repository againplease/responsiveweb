<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="highlight-container">
    <div class="highlighttitle">Highlights</div>
    <div class="highlight-slideshow">
        <div class="slides-wrapper">
            <div class="slide" data-index="0">
                <img src="<%= request.getContextPath() %>/images/slideshow/rairobot.jpg" alt="Highlight 2">
            </div>
            <div class="slide" data-index="1">
                <img src="<%= request.getContextPath() %>/images/slideshow/robot.jpg" alt="Highlight 3">
            </div>
            <div class="slide" data-index="2">
                <img src="<%= request.getContextPath() %>/images/slideshow/roboinnovator.jpg" alt="Highlight 4">
            </div>
            <div class="slide" data-index="3">
                <img src="<%= request.getContextPath() %>/images/slideshow/studentrai.jpg" alt="Highlight 5">
            </div>
            <div class="slide" data-index="4">
                <img src="<%= request.getContextPath() %>/images/slideshow/test.jpg" alt="Highlight 6">
            </div>
            <div class="slide" data-index="5">
                <img src="<%= request.getContextPath() %>/images/slideshow/vr.jpg" alt="Highlight 7">
            </div>
            <div class="slide" data-index="6">
                <img src="<%= request.getContextPath() %>/images/slideshow/raicamp.jpg" alt="Highlight 8">
            </div>
            <div class="slide" data-index="7">
                <img src="<%= request.getContextPath() %>/images/slideshow/phuwa.jpg" alt="Highlight 9">
            </div>
        </div>
    </div>
    <button class="prev-btn">❮</button>
    <button class="next-btn">❯</button>
</div>

<style>
.highlight-container {
    position: relative;
    width: 100%;
    padding: 0;
    background-color: #1e3a8a; /* Dark blue background */
    text-align: center; /* Center the title and touch text */
    max-height: 100%;
    height: 825px;
}

.highlighttitle {
    font-size: 36px;
    color: white;
    padding: 20px 0;
    font-weight: bold;
    position: relative;
}

.highlighttitle::after {
    content: '';
    position: absolute;
    bottom: 10px;
    left: 50%;
    transform: translateX(-50%);
    width: 50%;
    height: 3px;
    background-color: white;
}

.highlight-slideshow {
    width: 100%;
    max-width: none;
    overflow: hidden;
    position: relative;
    height: 750px; /* Reduced height to match the previous layout */
    background-color: transparent;
}

.slides-wrapper {
    position: relative;
    height: 100%;
}

.slide {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    opacity: 0; /* Default to hidden */
    transition: opacity 0.5s ease; /* Smooth opacity transition */
}

.slide img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.slide.active {
    opacity: 1; /* Show the active slide */
}

.prev-btn, .next-btn {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background: #3b82f6; /* Blue background */
    color: white; /* White text */
    border: none;
    padding: 10px;
    cursor: pointer;
    font-size: 18px;
    z-index: 10;
}

.prev-btn {
    left: 20px;
}

.next-btn {
    right: 20px;
}

.prev-btn:hover, .next-btn:hover {
    background: #2563eb; /* Slightly darker blue on hover */
}

.touch-text {
    font-size: 18px;
    color: white;
    padding: 10px 0;
    cursor: pointer;
    margin-top: 10px;
}

/* Responsive adjustments */
@media screen and (max-width: 768px) {
    .highlighttitle {
        font-size: 28px;
    }
    .highlight-slideshow {
        height: 450px;
    }
    .highlight-container{
        height:522px
    }
    .touch-text {
        font-size: 16px;
    }
    .prev-btn, .next-btn {
        top:53%
    }
}

@media screen and (max-width: 480px) {
    .highlighttitle {
        font-size: 24px;
    }
    .highlight-container{
        height:280px
    }
    .highlight-slideshow {
        height: 200px;
    }
    .touch-text {
        font-size: 14px;
    }
    .prev-btn, .next-btn {
        padding: 8px;
        font-size: 16px;
        margin-top:15px
    }
}
</style>

<script>
document.addEventListener('DOMContentLoaded', () => {
    const slides = document.querySelectorAll('.slide');
    const prevBtn = document.querySelector('.prev-btn');
    const nextBtn = document.querySelector('.next-btn');
    const touchText = document.querySelector('.touch-text');
    let currentIndex = 0;

    // Function to show the current slide
    function showSlide(index) {
        slides.forEach((slide, i) => {
            slide.classList.toggle('active', i === index);
        });
    }

    // Function to show the next slide
    function showNextSlide() {
        currentIndex = (currentIndex + 1) % slides.length; // Move to next slide
        showSlide(currentIndex);
    }

    // Function to show the previous slide
    function showPrevSlide() {
        currentIndex = (currentIndex - 1 + slides.length) % slides.length; // Move to previous slide
        showSlide(currentIndex);
    }

    // Show the first slide initially
    showSlide(currentIndex);

    // Automatically change slides every 3.5 seconds
    const autoSlideInterval = setInterval(showNextSlide, 3500);

    // Button controls
    nextBtn.addEventListener('click', (e) => {
        e.stopPropagation(); // Prevent the click from triggering the redirect
        showNextSlide();
    });

    prevBtn.addEventListener('click', (e) => {
        e.stopPropagation(); // Prevent the click from triggering the redirect
        showPrevSlide();
    });

    // Redirect to home.jsp when clicking the slideshow or touch text
    document.querySelector('.highlight-slideshow').addEventListener('click', redirectToMain);
    touchText.addEventListener('click', redirectToMain);
});
</script>