<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="util.ConfigUtil" %>
<%
    String admissionUrl = ConfigUtil.getProperty("admission.url");
%>

<!-- Desktop header navigation -->
<header id="desktop-header">
    <div class="logo-container">
        <img src="<%= request.getContextPath() %>/images/rai_logo.png" alt="Logo" class="logo">
    </div>
    <div class="header-title">
        <h1>Robotics and AI Engineering</h1>
        <span class="subtitle">School of International and Interdisciplinary Engineering</span>
    </div>
    <nav class="main-nav">
        <ul>
            <li><a href="<%= request.getContextPath() %>/pages/home.jsp">Home</a></li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle">About Us <span class="arrow">▼</span></a>
                <ul class="dropdown-menu">
                    <li><a href="<%= request.getContextPath() %>/pages/curriculum/curriculum.jsp">Curriculum</a></li>
                    <li><a href="<%= request.getContextPath() %>/pages/scholarship.jsp">Scholarship</a></li>
                    <li><a href="<%= request.getContextPath() %>/pages/collaboration.jsp">Collaboration</a></li>
                    <li><a href="<%= request.getContextPath() %>/pages/achievement.jsp">Achievement</a></li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle">Student Facility <span class="arrow">▼</span></a>
                <ul class="dropdown-menu">
                    <li><a href="<%= request.getContextPath() %>/pages/map/map.jsp">Faculty Map</a></li>                    
                    <li><a href="<%= request.getContextPath() %>/pages/student_roombooking.jsp">RAI Room Booking</a></li>                    
                </ul>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle">For Students <span class="arrow">▼</span></a>
                <ul class="dropdown-menu">
                    <li><a href="<%= request.getContextPath() %>/pages/academic_calendar.jsp">Academic Calendar</a></li>                 
                    <li><a href="<%= request.getContextPath() %>/pages/document/document.jsp">Documents</a></li>                    
                </ul>
            </li>
            <li><a href="<%= request.getContextPath() %>/pages/announcement/announcement.jsp">Announcement</a></li>
            <li><a href="<%= request.getContextPath() %>/pages/event/event.jsp">Events</a></li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle">Contact Us<span class="arrow">▼</span></a>
                <ul class="dropdown-menu">
                    <li><a href="<%= request.getContextPath() %>/pages/contact/contact.jsp">Contact Information</a></li>
                    <li><a href="<%= request.getContextPath() %>/pages/visitor_roombooking.jsp">Schedule a Visit</a></li>
                </ul>
            </li>
            <li class="admission-btn"><a href="<%= admissionUrl %>" target="_blank">APPLY NOW</a></li>
        </ul>
    </nav>
</header>

<!-- Mobile navigation elements: hamburger menu and side menu -->
<div id="hamburger-menu" onclick="toggleSideMenu()">
    <div></div>
    <div></div>
    <div></div>
</div>
<div id="side-menu">
    <div id="side-menu-content">
        <button onclick="goToHomePage()">Home</button>
        <div class="menu-dropdown">
            <button class="dropdown-btn" onclick="toggleDropdown('about-submenu')">
                About Us
                <span class="dropdown-icon">▼</span>
            </button>
            <div id="about-submenu" class="dropdown-content">
                <button onclick="goToCurriculum()">Curriculum</button>
                <button onclick="goToScholarship()">Scholarship</button>
                <button onclick="goToCollaboration()">Collaboration</button>
                <button onclick="goToAchievement()">Achievement</button>               
            </div>
        </div>
        <div class="menu-dropdown">
            <button class="dropdown-btn" onclick="toggleDropdown('student-submenu')">
                Student Facility
                <span class="dropdown-icon">▼</span>
            </button>
            <div id="student-submenu" class="dropdown-content">
                <button onclick="goToMapPage()">Faculty Map</button>
                <button onclick="goToStudentBooking()">RAI Room Booking</button>              
            </div>
        </div>
        <div class="menu-dropdown">
            <button class="dropdown-btn" onclick="toggleDropdown('document-submenu')">
                For Students
                <span class="dropdown-icon">▼</span>
            </button>
            <div id="document-submenu" class="dropdown-content">
                <button onclick="goToCalendar()">Academic Calendar</button>
                <button onclick="goToDocument()">Document</button>            
            </div>
        </div>
        <button onclick="goToAnnouncement()">Announcement</button>
        <button onclick="goToEventPage()">Events</button>
        <div class="menu-dropdown">
            <button class="dropdown-btn" onclick="toggleDropdown('contact-submenu')">
                Contact Us
                <span class="dropdown-icon">▼</span>
            </button>
            <div id="contact-submenu" class="dropdown-content">
                <button onclick="goToContactPage()">Contact Information</button>
                <button onclick="gotoVisitorBooking()">Schedule a Visit</button>
            </div>
        </div>
        <button class="admission-btn-mobile" onclick="goToAdmissionPage()">Admission</button>
    </div>
</div>

<!-- CSS Styles for navigation elements with responsive design -->
<style>
    /* Reset and common styles */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    
    body {
        font-family: Arial, sans-serif;
    }
    
    /* Desktop header styles */
    #desktop-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: white;
        padding: 0 20px;
        height: 120px;
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        z-index: 1000;
        box-shadow: 0 2px 5px rgba(0,0,0,0.3);
    }
    
    .logo-container {
        display: flex;
        align-items: center;
    }
    
    .logo {
        height: 50px;
        margin-right: 20px;
    }
    
    .header-title {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        margin-left: 20px;
    }
    
    .header-title h1 {
        font-size: 24px;
        font-weight: bold;
        color: #333;
        margin: 0;
    }
    
    .header-title .subtitle {
        font-size: 12px;
        color: #666;
        margin: 0;
    }
    
    .main-nav ul {
        display: flex;
        list-style: none;
    }
    
    .main-nav li {
        position: relative;
    }
    
    .main-nav a {
        color: #333;
        text-decoration: none;
        padding: 25px 15px;
        display: block;
        transition: background-color 0.3s;
    }
    
    .main-nav a:hover {
        background-color: #f5f5f5;
    }
    
    /* Admission button styles */
    .admission-btn a {
        background-color: #E35205;
        color: white !important;
        border-radius: 4px;
        padding: 10px 15px !important;
        margin: 15px 5px;
    }
    
    .admission-btn a:hover {
        background-color: #c94500;
    }
    
    /* Desktop dropdown styles */
    .dropdown-toggle {
        display: flex;
        align-items: center;
    }
    
    .arrow {
        margin-left: 5px;
        font-size: 10px;
    }
    
    .main-nav .dropdown-menu {
        display: none; /* Hidden by default */
        position: absolute;
        top: 100%; /* Position below the parent */
        left: 0; /* Align with the left edge of the parent */
        background-color: white;
        min-width: 180px;
        box-shadow: 0 8px 16px rgba(0,0,0,0.1);
        z-index: 1001;
        border-radius: 4px;
        flex-direction: column; /* Stack items vertically */
    }
    
    .main-nav .dropdown:hover .dropdown-menu {
        display: flex; /* Show on hover */
    }
    
    .dropdown-menu li {
        width: 100%; /* Ensure each item takes full width */
    }
    
    .dropdown-menu a {
        padding: 12px 15px;
        color: #333;
        display: block; /* Ensure links take full width */
    }
    
    .dropdown-menu a:hover {
        background-color: #f5f5f5;
    }
    
    /* Mobile hamburger menu styles */
    #hamburger-menu {
        display: none;
        position: fixed;
        top: 10px;
        right: 10px;
        width: 50px;
        height: 40px;
        cursor: pointer;
        z-index: 1100;
        padding: 10px;
        margin-top: 10px;
        margin-right: 15px;
    }
    
    #hamburger-menu div {
        width: 100%;
        height: 4px;
        background-color: #333;
        margin: 6px 0;
        transition: 0.4s;
        border-radius: 2px;
    }
    
    /* Hamburger menu animation */
    #hamburger-menu.open div:nth-child(1) {
        transform: rotate(-45deg) translate(-5px, 6px);
    }
    
    #hamburger-menu.open div:nth-child(2) {
        opacity: 0;
    }
    
    #hamburger-menu.open div:nth-child(3) {
        transform: rotate(45deg) translate(-5px, -6px);
    }
    
    /* Side menu styles */
    #side-menu {
        position: fixed;
        top: 0;
        right: -300px;
        width: 300px;
        height: 100%;
        background-color: #f8f8f8;
        transition: 0.3s;
        z-index: 1050;
        padding-top: 60px;
        font-size: 20px;
        overflow-y: auto;
        box-shadow: -2px 0 5px rgba(0, 0, 0, 0.1);
    }
    
    #side-menu.open {
        right: 0;
    }
    
    #side-menu-content {
        padding: 20px;
        padding-top: 25px;
    }
    
    #side-menu-content button {
        width: 100%;
        padding: 20px;
        margin: 10px 0;
        background-color: white;
        color: #333;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 20px;
        transition: background-color 0.2s ease;
        text-align: left;
    }
    
    #side-menu-content button:hover {
        background-color: #e0e0e0;
    }
    
    /* Mobile admission button */
    .admission-btn-mobile {
        background-color: #E35205 !important;
        color: white !important;
    }
    
    .admission-btn-mobile:hover {
        background-color: #c94500 !important;
    }
    
    /* Mobile dropdown styles */
    .menu-dropdown {
        width: 100%;
        margin: 10px 0;
    }
    
    .dropdown-btn {
        width: 100%;
        padding: 15px;
        background-color: #f5f5f5;
        color: #333;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.2s ease;
        text-align: left;
        position: relative;
    }

    .dropdown-icon {
        position: absolute;
        right: 15px;
        transition: transform 0.3s ease;
        font-size: 12px;
    }
    
    .dropdown-btn:hover {
        background-color: #e0e0e0;
    }
    
    .dropdown-btn.active .dropdown-icon {
        transform: rotate(180deg);
    }
    
    .dropdown-content {
        display: none;
        padding-left: 15px;
        overflow: hidden;
        transition: max-height 0.3s ease;
    }
    
    .dropdown-content button {
        background-color: #f0f0f0;
        margin: 5px 0;
    }
    
    .dropdown-content button:hover {
        background-color: #e0e0e0;
    }
    
    .dropdown-content.show {
        display: block;
    }
    
    /* Responsive design */
    @media screen and (max-width: 1024px) {
        #desktop-header {
            display: none;
        }
        
        #hamburger-menu {
            display: block;
        }
        
        body {
            padding-top: 0;
        }
    }
    
    @media screen and (max-width: 768px) {
        #hamburger-menu {
            top: 8px;
            right: 8px;
            width: 40px;
            height: 30px;
            margin-top: 10px;
        }
        
        #hamburger-menu div {
            height: 3px;
            margin: 5px 0;
        }
    }
    
    @media screen and (max-width: 480px) {
        #side-menu {
            width: 85%;
            right: -85%;
        }
        
        #hamburger-menu {
            top: 5px;
            right: 5px;
            width: 40px;
            height: 30px;
            margin-top: 10px;
        }
        
        #hamburger-menu div {
            height: 3px;
            margin: 4px 0;
        }
        
        #side-menu-content button {
            padding: 12px;
            margin: 8px 0;
        }
    }
</style>

<!-- JavaScript functions for navigation -->
<script>
    // Function to toggle the side menu (for hamburger)
    function toggleSideMenu() {
        const hamburgerMenu = document.getElementById('hamburger-menu');
        const sideMenu = document.getElementById('side-menu');
        
        hamburgerMenu.classList.toggle('open');
        sideMenu.classList.toggle('open');
    }

    // Function to toggle dropdown in the side menu
    function toggleDropdown(dropdownId) {
        const dropdown = document.getElementById(dropdownId);
        const dropdownBtn = dropdown.previousElementSibling;
        
        // Close any open dropdowns first
        const allDropdowns = document.getElementsByClassName('dropdown-content');
        const allDropdownBtns = document.getElementsByClassName('dropdown-btn');
        
        for (let i = 0; i < allDropdowns.length; i++) {
            if (allDropdowns[i].id !== dropdownId && allDropdowns[i].classList.contains('show')) {
                allDropdowns[i].classList.remove('show');
                allDropdownBtns[i].classList.remove('active');
            }
        }
        
        // Toggle current dropdown
        dropdown.classList.toggle('show');
        dropdownBtn.classList.toggle('active');
    }

    // Navigation functions
    function goToHomePage() {
        window.location.href = '<%= request.getContextPath() %>/pages/home.jsp';
    }
    
    function goToMapPage() {
        window.location.href = '<%= request.getContextPath() %>/pages/map/map.jsp';
    }
    
    function goToEventPage() {
        window.location.href = '<%= request.getContextPath() %>/pages/event/event.jsp';
    }
    
    function goToCurriculum() {
        window.location.href = '<%= request.getContextPath() %>/pages/curriculum/curriculum.jsp';
    }
    
    function goToAchievement() {
        window.location.href = '<%= request.getContextPath() %>/pages/achievement.jsp';
    }
    
    function goToCollaboration() {
        window.location.href = '<%= request.getContextPath() %>/pages/collaboration.jsp';
    }
    
    function goToScholarship() {
        window.location.href = '<%= request.getContextPath() %>/pages/scholarship.jsp';
    }
    
    function goToAdmissionPage() {
        let newTab = window.open('<%= admissionUrl %>', '_blank');
        let checkClosed = setInterval(function () {
            if (newTab.closed) {
                clearInterval(checkClosed);
                window.location.href = '<%= request.getContextPath() %>/pages/home.jsp';
            }
        }, 1000); // Check every second if the tab is closed
    }
    function goToDocument(){
        window.location.href = '<%= request.getContextPath() %>/pages/document/document.jsp';
    }
    function goToCalendar() {
        window.location.href = '<%= request.getContextPath() %>/pages/academic_calendar.jsp';
    }
    
    function goToAnnouncement() {
        window.location.href = '<%= request.getContextPath() %>/pages/announcement/announcement.jsp';
    }
    
    function goToContactPage() {
        window.location.href = '<%= request.getContextPath() %>/pages/contact/contact.jsp';
    }
    
    function goToStudentBooking() {
        window.location.href = '<%= request.getContextPath() %>/pages/student_roombooking.jsp';
    }
    
    function gotoVisitorBooking() {
        window.location.href = '<%= request.getContextPath() %>/pages/visitor_booking.jsp';
    }

    // Event listener to close side menu when clicking outside
    document.addEventListener('click', function(event) {
        const sideMenu = document.getElementById('side-menu');
        const hamburgerMenu = document.getElementById('hamburger-menu');
        
        if (sideMenu.classList.contains('open') && 
            !sideMenu.contains(event.target) && 
            !hamburgerMenu.contains(event.target)) {
            sideMenu.classList.remove('open');
            hamburgerMenu.classList.remove('open');
        }
    });
    
    // Handle touch events for better mobile experience
    let touchStartX;
    
    document.addEventListener('touchstart', function(e) {
        touchStartX = e.changedTouches[0].screenX;
    }, { passive: true });
    
    // Swipe to close the menu
    document.addEventListener('touchend', function(e) {
        const sideMenu = document.getElementById('side-menu');
        const hamburgerMenu = document.getElementById('hamburger-menu');
        
        if (sideMenu.classList.contains('open')) {
            const touchEndX = e.changedTouches[0].screenX;
            // Detect right swipe to close
            if (touchEndX - touchStartX > 50) {
                sideMenu.classList.remove('open');
                hamburgerMenu.classList.remove('open');
            }
        }
    }, { passive: true });
    
    // Lock body scroll when menu is open
    function toggleBodyScroll(lock) {
        document.body.style.overflow = lock ? 'hidden' : '';
    }
    
    // Observe side menu state to lock/unlock body scroll
    const sideMenuObserver = new MutationObserver(function(mutations) {
        mutations.forEach(function(mutation) {
            if (mutation.attributeName === 'class') {
                const isOpen = document.getElementById('side-menu').classList.contains('open');
                toggleBodyScroll(isOpen);
            }
        });
    });
    
    // Start observing side menu
    window.addEventListener('DOMContentLoaded', function() {
        const sideMenu = document.getElementById('side-menu');
        sideMenuObserver.observe(sideMenu, { attributes: true });
    });
</script>