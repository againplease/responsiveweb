<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="sponsor-container">
    <div class="sponsortitle">Sponsored by</div>
    <div class="sponsors-section">
        <div class="sponsor-item"><img src="../images/sponsor/abb.png" alt="Sponsor 1"></div>
        <div class="sponsor-item"><img src="../images/sponsor/autodesk.png" alt="Sponsor 2"></div>
        <div class="sponsor-item"><img src="../images/sponsor/aws.png" alt="Sponsor 3"></div>
        <div class="sponsor-item"><img src="../images/sponsor/delta.png" alt="Sponsor 4"></div>
        <div class="sponsor-item"><img src="../images/sponsor/depa.png" alt="Sponsor 5"></div>
        <div class="sponsor-item"><img src="../images/sponsor/dsignage.png" alt="Sponsor 6"></div>
        <div class="sponsor-item"><img src="../images/sponsor/festo.png" alt="Sponsor 7"></div>
        <div class="sponsor-item"><img src="../images/sponsor/gti.png" alt="Sponsor 8"></div>
        <div class="sponsor-item"><img src="../images/sponsor/krungthai.png" alt="Sponsor 9"></div>
        <div class="sponsor-item"><img src="../images/sponsor/mitsu.png" alt="Sponsor 10"></div>
        <div class="sponsor-item"><img src="../images/sponsor/nachi.png" alt="Sponsor 11"></div>
        <div class="sponsor-item"><img src="../images/sponsor/nvidia.png" alt="Sponsor 12"></div>
        <div class="sponsor-item"><img src="../images/sponsor/ptt.png" alt="Sponsor 13"></div>
        <div class="sponsor-item"><img src="../images/sponsor/pwc.png" alt="Sponsor 14"></div>
        <div class="sponsor-item"><img src="../images/sponsor/seagate.png" alt="Sponsor 15"></div>
        <div class="sponsor-item"><img src="../images/sponsor/solimac.png" alt="Sponsor 16"></div>
        <div class="sponsor-item"><img src="../images/sponsor/thaisteel.png" alt="Sponsor 17"></div>
    </div>
</div>
<style>
    .sponsor-container {
        background-color: white;
        padding: 30px 20px;
        text-align: center;
    }
    
    .sponsortitle {
        font-size: 30px;
        margin-bottom: 25px;
        font-weight: bold;
    }
    
    .sponsors-section {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 20px;
    }
    
    .sponsor-item {
        display: flex;
        align-items: center;
        justify-content: center;
        background-color: white;
        padding: 10px;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.05);
    }
    
    .sponsor-item img {
        max-width: 100%;
        height: auto;
        object-fit: contain;
        transition: transform 0.3s ease;
    }
    /* 1026px and above */
    @media (min-width: 1026px) {
        .sponsortitle { font-size: 32px; }
        .sponsor-item {
            width: 150px;
            height: 100px;
        }
    }
    
    /* 769px - 1025px */
    @media (min-width: 769px) and (max-width: 1025px) {
        .sponsortitle { font-size: 28px; }
        .sponsor-item {
            width: 130px;
            height: 90px;
        }
    }
    
    /* 481px - 768px */
    @media (min-width: 481px) and (max-width: 768px) {
        .sponsortitle { font-size: 26px; }
        .sponsor-item {
            width: 110px;
            height: 80px;
        }
        .sponsors-section {
            gap: 15px;
        }
    }
    
    /* 480px and below */
    @media (max-width: 480px) {
        .sponsortitle { font-size: 22px; }
        .sponsor-item {
            width: 90px;
            height: 70px;
        }
        .sponsors-section {
            gap: 10px;
        }
    }
</style>