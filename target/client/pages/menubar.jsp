<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="util.ConfigUtil" %>
<%@ page import="java.util.Locale" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% 
    String admissionUrl = ConfigUtil.getProperty("admission.url");
    Locale locale = (Locale) session.getAttribute("locale");
    String lang = (String) session.getAttribute("language"); // Declare lang once here
    if (locale == null) {
        locale = Locale.of("en", "US"); // Default to English
        session.setAttribute("locale", locale);
    }
%>
<fmt:setLocale value="<%= locale %>" />
<fmt:setBundle basename="messages" />

<!-- Desktop header navigation -->
<header id="desktop-header">
    <div class="logo-container">
        <a href="<%= request.getContextPath() %>/pages/home.jsp">
            <img src="<%= request.getContextPath() %>/images/rai_logo.png" alt="Logo" class="logo">
        </a>
    </div>
    <div class="header-title">
        <h1><fmt:message key="header.title" /></h1>
        <span class="subtitle"><fmt:message key="header.subtitle" /></span>
    </div>
    <nav class="main-nav">
        <ul>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle"><fmt:message key="nav.aboutUs" /> <span class="arrow">▼</span></a>
                <ul class="dropdown-menu">
                    <li><a href="<%= request.getContextPath() %>/pages/curriculum/curriculum.jsp"><fmt:message key="nav.curriculum" /></a></li>
                    <li><a href="<%= request.getContextPath() %>/pages/scholarship.jsp"><fmt:message key="nav.scholarship" /></a></li>
                    <li><a href="<%= request.getContextPath() %>/pages/collaboration.jsp"><fmt:message key="nav.collaboration" /></a></li>
                    <li><a href="<%= request.getContextPath() %>/pages/achievement.jsp"><fmt:message key="nav.achievement" /></a></li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle"><fmt:message key="nav.studentFacility" /> <span class="arrow">▼</span></a>
                <ul class="dropdown-menu">
                    <li><a href="<%= request.getContextPath() %>/pages/map/map.jsp"><fmt:message key="nav.facultyMap" /></a></li>                    
                    <li><a href="<%= request.getContextPath() %>/pages/student_booking/register.jsp"><fmt:message key="nav.roomBooking" /></a></li>                    
                </ul>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle"><fmt:message key="nav.forStudents" /> <span class="arrow">▼</span></a>
                <ul class="dropdown-menu">
                    <li><a href="<%= request.getContextPath() %>/pages/academic_calendar.jsp"><fmt:message key="nav.academicCalendar" /></a></li>                 
                    <li class="dropdown submenu">
                        <a href="<%= request.getContextPath() %>/pages/document/document.jsp" class="dropdown-toggle"><fmt:message key="nav.documents" /><span class="arrow">▶</span></a>
                        <ul class="dropdown-menu submenu-content">
                            <li><a href="<%= request.getContextPath() %>/pages/document/document_type.jsp?type=General"><fmt:message key="nav.general" /></a></li>
                            <li><a href="<%= request.getContextPath() %>/pages/document/document_type.jsp?type=Internship"><fmt:message key="nav.internship" /></a></li>
                            <li><a href="<%= request.getContextPath() %>/pages/document/document_type.jsp?type=Cooperative"><fmt:message key="nav.cooperative" /></a></li>
                            <li><a href="<%= request.getContextPath() %>/pages/document/disbursement.jsp"><fmt:message key="nav.disbursement" /></a></li>
                        </ul>
                    </li>                    
                </ul>
            </li>
            <li><a href="<%= request.getContextPath() %>/pages/announcement/announcement.jsp"><fmt:message key="nav.announcement" /></a></li>
            <li class="dropdown">
                <a href="<%= request.getContextPath() %>/pages/event/event.jsp" class="dropdown-toggle"><fmt:message key="nav.events" /><span class="arrow">▼</span></a>
                <ul class="dropdown-menu">
                    <li><a href="<%= request.getContextPath() %>/pages/event/event_type.jsp?status=ongoing"><fmt:message key="nav.ongoingEvents" /></a></li>
                    <li><a href="<%= request.getContextPath() %>/pages/event/event_type.jsp?status=finished"><fmt:message key="nav.finishedEvents" /></a></li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle"><fmt:message key="nav.contactUs" /> <span class="arrow">▼</span></a>
                <ul class="dropdown-menu">
                    <li><a href="<%= request.getContextPath() %>/pages/contact/contact.jsp"><fmt:message key="nav.contactInfo" /></a></li>
                    <li><a href="<%= request.getContextPath() %>/pages/visitor_booking/visit_scheduler.jsp"><fmt:message key="nav.scheduleVisit" /></a></li>
                </ul>
            </li>
            <!--li class="language-switch">
                <% if ("th".equals(lang)) { %>
                    <a href="<%= request.getContextPath() %>/LanguageServlet?lang=en&returnUrl=<%= request.getRequestURI() %>">English</a>
                <% } else { %>
                    <a href="<%= request.getContextPath() %>/LanguageServlet?lang=th&returnUrl=<%= request.getRequestURI() %>">Thai</a>
                <% } %>
            </li-->
            <li class="admission-btn"><a href="<%= admissionUrl %>" target="_blank"><fmt:message key="nav.applyNow" /></a></li>
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
        <button onclick="goToHomePage()"><fmt:message key="nav.home" /></button>
        <div class="menu-dropdown">
            <button class="dropdown-btn" onclick="toggleDropdown('about-submenu')">
                <fmt:message key="nav.aboutUs" />
                <span class="dropdown-icon">▼</span>
            </button>
            <div id="about-submenu" class="dropdown-content">
                <button onclick="goToCurriculum()"><fmt:message key="nav.curriculum" /></button>
                <button onclick="goToScholarship()"><fmt:message key="nav.scholarship" /></button>
                <button onclick="goToCollaboration()"><fmt:message key="nav.collaboration" /></button>
                <button onclick="goToAchievement()"><fmt:message key="nav.achievement" /></button>               
            </div>
        </div>
        <div class="menu-dropdown">
            <button class="dropdown-btn" onclick="toggleDropdown('student-submenu')">
                <fmt:message key="nav.studentFacility" />
                <span class="dropdown-icon">▼</span>
            </button>
            <div id="student-submenu" class="dropdown-content">
                <button onclick="goToMapPage()"><fmt:message key="nav.facultyMap" /></button>
                <button onclick="goToStudentBooking()"><fmt:message key="nav.roomBooking" /></button>              
            </div>
        </div>
        <div class="menu-dropdown">
            <button class="dropdown-btn" onclick="toggleDropdown('forstudents-submenu')">
                <fmt:message key="nav.forStudents" />
                <span class="dropdown-icon">▼</span>
            </button>
            <div id="forstudents-submenu" class="dropdown-content">
                <button onclick="goToCalendar()"><fmt:message key="nav.academicCalendar" /></button>
                <div class="menu-dropdown">
                    <button class="dropdown-btn" onclick="toggleDropdown('document-submenu')">
                        <fmt:message key="nav.documents" />
                        <span class="dropdown-icon">▼</span>
                    </button>
                    <div id="document-submenu" class="dropdown-content">
                        <button onclick="goToDocumentType('General')"><fmt:message key="nav.general" /></button>
                        <button onclick="goToDocumentType('Internship')"><fmt:message key="nav.internship" /></button>
                        <button onclick="goToDocumentType('Cooperative')"><fmt:message key="nav.cooperative" /></button>
                        <button onclick="goToDocumentType('Disbursement')"><fmt:message key="nav.disbursement" /></button>
                    </div>
                </div>
            </div>
        </div>
        <button onclick="goToAnnouncement()"><fmt:message key="nav.announcement" /></button>
        <div class="menu-dropdown">
            <button class="dropdown-btn" onclick="toggleDropdown('events-submenu')">
                <fmt:message key="nav.events" />
                <span class="dropdown-icon">▼</span>
            </button>
            <div id="events-submenu" class="dropdown-content">
                <button onclick="goToEventType('ongoing')"><fmt:message key="nav.ongoingEvents" /></button>
                <button onclick="goToEventType('finished')"><fmt:message key="nav.finishedEvents" /></button>
            </div>
        </div>
        <div class="menu-dropdown">
            <button class="dropdown-btn" onclick="toggleDropdown('contact-submenu')">
                <fmt:message key="nav.contactUs" />
                <span class="dropdown-icon">▼</span>
            </button>
            <div id="contact-submenu" class="dropdown-content">
                <button onclick="goToContactPage()"><fmt:message key="nav.contactInfo" /></button>
                <button onclick="gotoVisitorBooking()"><fmt:message key="nav.scheduleVisit" /></button>
            </div>
        </div>
        <!-- Language switcher for mobile -->
        <!--div class="menu-dropdown">
            <% if ("th".equals(lang)) { %>
                <button onclick="window.location.href='<%= request.getContextPath() %>/LanguageServlet?lang=en&returnUrl=<%= request.getRequestURI() %>'">English</button>
            <% } else { %>
                <button onclick="window.location.href='<%= request.getContextPath() %>/LanguageServlet?lang=th&returnUrl=<%= request.getRequestURI() %>'">Thai</button>
            <% } %>
        </div--->
    </div>
    <button class="admission-btn-mobile" onclick="goToAdmissionPage()"><fmt:message key="nav.applyNow" /></button>
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
    
    .main-nav .dropdown:hover > .dropdown-menu {
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
    
    /* Submenu styles for Documents (side menu on desktop) */
    .submenu {
        position: relative;
    }
    
    .submenu .submenu-content {
        display: none; /* Hidden by default */
        position: absolute;
        top: 0;
        left: 100%; /* Position the submenu to the right of the parent */
        background-color: white;
        min-width: 180px;
        box-shadow: 0 8px 16px rgba(0,0,0,0.1);
        z-index: 1001;
        border-radius: 4px;
    }
    
    .submenu:hover .submenu-content {
        display: flex; /* Show only when hovering over the submenu item */
        flex-direction: column;
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
        background-color: #333; /* Default color */
        margin: 6px 0;
        transition: background-color 0.3s ease, transform 0.4s ease; /* Add transition for color */
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
        text-align: center;
        width: 100%;
        padding: 20px;
        margin: 10px 0;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 20px;
        transition: background-color 0.2s ease;
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
        
        // Toggle the current dropdown
        const isCurrentlyOpen = dropdown.classList.contains('show');
        dropdown.classList.toggle('show');
        dropdownBtn.classList.toggle('active');

        // If we're opening this dropdown, close other dropdowns at the same level (siblings)
        if (!isCurrentlyOpen) {
            // Find the parent dropdown-content (if any) to determine the level
            const parentDropdownContent = dropdown.closest('.dropdown-content');
            let dropdownsToClose;

            if (parentDropdownContent) {
                // If this dropdown is nested, only close siblings within the same parent dropdown-content
                dropdownsToClose = parentDropdownContent.querySelectorAll('.dropdown-content');
            } else {
                // If this dropdown is top-level, close all other top-level dropdowns
                dropdownsToClose = document.querySelectorAll('#side-menu-content > .menu-dropdown > .dropdown-content');
            }

            // Close all sibling dropdowns (but not the current one or its children)
            dropdownsToClose.forEach(otherDropdown => {
                if (otherDropdown !== dropdown && !dropdown.contains(otherDropdown) && !otherDropdown.contains(dropdown)) {
                    otherDropdown.classList.remove('show');
                    const otherDropdownBtn = otherDropdown.previousElementSibling;
                    if (otherDropdownBtn) {
                        otherDropdownBtn.classList.remove('active');
                    }
                }
            });
        }
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
    
    function goToEventType(status) {
        window.location.href = '<%= request.getContextPath() %>/pages/event/event_type.jsp?status=' + status;
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
    
    function goToDocument() {
        window.location.href = '<%= request.getContextPath() %>/pages/document/document.jsp';
    }
    
    function goToDocumentType(type) {
        window.location.href = '<%= request.getContextPath() %>/pages/document/document_type.jsp?type=' + type;
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
        window.location.href = '<%= request.getContextPath() %>/pages/student_booking/register.jsp';
    }
    
    function gotoVisitorBooking() {
        window.location.href = '<%= request.getContextPath() %>/pages/visitor_booking/visit_scheduler.jsp';
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
    // Place this script at the end of your existing script section in menubar.jsp

    // Variables to track scroll position
    let lastScrollPosition = 0;
    let ticking = false;

    // Function to handle the header fade effect
    function updateHeaderVisibility() {
        const header = document.getElementById('desktop-header');
        const currentScrollPosition = window.pageYOffset || document.documentElement.scrollTop;
        
        // Update header visibility
        if (window.innerWidth <= 1024) {
            header.style.opacity = "1";
            header.style.transform = "translateY(0)";
        } else {
            // When scrolling down beyond a threshold (e.g., 100px), fade out the header
            if (currentScrollPosition > 100) {
                // When scrolling down
                if (currentScrollPosition > lastScrollPosition) {
                    header.style.opacity = "0";
                    header.style.transform = "translateY(-100%)";
                } 
                // When scrolling up
                else {
                    header.style.opacity = "1";
                    header.style.transform = "translateY(0)";
                }
            } 
            // When close to the top, always show the header
            else {
                header.style.opacity = "1";
                header.style.transform = "translateY(0)";
            }
        }
        
        // Update hamburger menu color
        updateHamburgerColor();
        
        lastScrollPosition = currentScrollPosition;
        ticking = false;
    }

    // Set up scroll listener with requestAnimationFrame for performance
    function onScroll() {
        if (!ticking) {
            window.requestAnimationFrame(updateHeaderVisibility);
            ticking = true;
        }
    }

    // Add scroll event listener
    window.addEventListener('scroll', onScroll, { passive: true });

    // Add resize event listener to reset header visibility on window resize
    window.addEventListener('resize', function() {
        const header = document.getElementById('desktop-header');
        
        // Reset header visibility on resize
        if (window.innerWidth <= 1024) {
            header.style.opacity = "1";
            header.style.transform = "translateY(0)";
        } else {
            updateHeaderVisibility();
        }
        
        // Update hamburger color on resize
        updateHamburgerColor();
    }, { passive: true });

    // Initialize header visibility and hamburger color on page load
    document.addEventListener('DOMContentLoaded', function() {
        const header = document.getElementById('desktop-header');
        
        // Add transition properties to desktop header
        header.style.transition = "opacity 0.3s ease, transform 0.3s ease";
        
        // Initialize header visibility and hamburger color
        updateHeaderVisibility();
    });
    function calculateLuminance(rgb) {
        // Extract RGB values from the string (e.g., "rgb(30, 58, 138)")
        const rgbValues = rgb.match(/\d+/g).map(Number);
        const r = rgbValues[0];
        const g = rgbValues[1];
        const b = rgbValues[2];
        
        // Luminance formula: L = 0.299R + 0.587G + 0.114B
        return 0.299 * r + 0.587 * g + 0.114 * b;
    }
    function updateHamburgerColor() {
        const hamburgerMenu = document.getElementById('hamburger-menu');
        
        // Only apply this on mobile view (≤1024px)
        if (window.innerWidth > 1024) {
            return;
        }
        
        // Get all sections
        const sections = document.querySelectorAll('.robotics-section, .vdo-section, .facilities-container, .highlight-container, .faq-section, .sponsor-section');
        if (!sections.length) return;
        
        // Find the section at the top of the viewport
        let topSection = null;
        const scrollPosition = window.pageYOffset || document.documentElement.scrollTop;
        
        sections.forEach(section => {
            const rect = section.getBoundingClientRect();
            const sectionTop = rect.top + scrollPosition;
            const sectionBottom = sectionTop + rect.height;
            
            // Check if the section is at the top of the viewport
            if (scrollPosition >= sectionTop && scrollPosition < sectionBottom) {
                topSection = section;
            }
        });
        
        // If no section is found (e.g., at the very top of the page), default to the first section
        if (!topSection && scrollPosition < sections[0].getBoundingClientRect().top + scrollPosition) {
            topSection = sections[0];
        }
        
        if (!topSection) return;
        
        // Get the computed background color of the section
        const computedStyle = window.getComputedStyle(topSection);
        let backgroundColor = computedStyle.backgroundColor;
        
        // If the background color is transparent, traverse up the DOM to find a non-transparent background
        let currentElement = topSection;
        while (backgroundColor === 'rgba(0, 0, 0, 0)' || backgroundColor === 'transparent') {
            currentElement = currentElement.parentElement;
            if (!currentElement) {
                backgroundColor = 'rgb(255, 255, 255)'; // Default to white if no background found
                break;
            }
            backgroundColor = window.getComputedStyle(currentElement).backgroundColor;
        }
        
        // Calculate luminance
        const luminance = calculateLuminance(backgroundColor);
        
        // Update hamburger menu color
        const hamburgerLines = hamburgerMenu.querySelectorAll('div');
        if (luminance > 120) {
            // Light background: use black
            hamburgerLines.forEach(line => {
                line.style.backgroundColor = '#333';
            });
        } else {
            // Dark background: use white
            hamburgerLines.forEach(line => {
                line.style.backgroundColor = '#fff';
            });
        }
    }

</script>