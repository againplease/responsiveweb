<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String scholarshipLink = "https://www.facebook.com/KMITL.SIIE";
%>
<div class="faq-container">
    <div class="title">Frequently Asked Questions</div>
    <div class="content">
        <div class="faq-section">
            <div class="faq-item">
                <div class="faq-question">
                    <div class="faq-content">
                        <div class="faq-dot"></div>
                        <span>What is RAI?</span>
                    </div>
                    <div class="faq-toggle">▼</div>
                </div>
                <div class="faq-answer">
                    RAI stands for Bachelor of Engineering Program in Robotics and Artificial Intelligence Engineering (International Program).
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question">
                    <div class="faq-content">
                        <div class="faq-dot"></div>
                        <span>What’s the skill required?</span>
                    </div>
                    <div class="faq-toggle">▼</div>
                </div>
                <div class="faq-answer">
                    We require teamwork, passion, and hard work because we believe that “The results you achieve will be in direct proportion to the effort you apply.”
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question">
                    <div class="faq-content">
                        <div class="faq-dot"></div>
                        <span>What do we learn?</span>
                    </div>
                    <div class="faq-toggle">▼</div>
                </div>
                <div class="faq-answer">
                    In the first year, we study basic engineering and an introduction to robotics and AI. The second year covers deeper topics like computer vision and algorithms, while the third and fourth years allow students to choose electives based on their interests.
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question">
                    <div class="faq-content">
                        <div class="faq-dot"></div>
                        <span>What job can I apply for after graduation?</span>
                    </div>
                    <div class="faq-toggle">▼</div>
                </div>
                <div class="faq-answer">
                    Career opportunities include Roboticist, AI Engineer, System Engineer, AI Programmer, Solution Engineer, and high-tech startup entrepreneur. Additionally, roles like Automation Engineer, Software Developer, and other positions in the tech industry are also available.
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question">
                    <div class="faq-content">
                        <div class="faq-dot"></div>
                        <span>Is there a lot of projects?</span>
                    </div>
                    <div class="faq-toggle">▼</div>
                </div>
                <div class="faq-answer">
                    The KMITL engineering program combines both theory and hands-on learning through projects that enhance knowledge and skills. Students typically work on 2-5 projects per semester.
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question">
                    <div class="faq-content">
                        <div class="faq-dot"></div>
                        <span>How much is the tuition fee?</span>
                    </div>
                    <div class="faq-toggle">▼</div>
                </div>
                <div class="faq-answer">
                    The tuition fee is 105,000 THB per semester for RAI and 135,000 THB per semester for MATBOT.
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question">
                    <div class="faq-content">
                        <div class="faq-dot"></div>
                        <span>Do you offer scholarships?</span>
                    </div>
                    <div class="faq-toggle">▼</div>
                </div>
                <div class="faq-answer">
                    Scholarships are offered to applicants with excellent academic performance to pursue their undergraduate education in international programs, based on the requirements outlined in the announcement.
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question">
                    <div class="faq-content">
                        <div class="faq-dot"></div>
                        <span>What are the requirements to apply?</span>
                    </div>
                    <div class="faq-toggle">▼</div>
                </div>
                <div class="faq-answer">
                    We require a minimum SAT score of 1020, a language proficiency certificate, a personal statement, and two recommendation letters.
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question">
                    <div class="faq-content">
                        <div class="faq-dot"></div>
                        <span>What should I include in my portfolio?</span>
                    </div>
                    <div class="faq-toggle">▼</div>
                </div>
                <div class="faq-answer">
                    Your academic activities related to Robotics, AI, and engineering that show your passion and skills.
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .faq-container {
        background-color: #ffdbbb;
        padding: 20px;
    }

    :root {
        --primary-color: #FF5722;
        --secondary-color: #FFA560;
        --background-color: #ffdbbb;
        --text-color: #333333;
    }

    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }

    .title {
        text-align: center;
        font-size: 30px;
        font-weight: bold;
        padding-top: 30px;
    }

    .content {
        padding: 0 20px 90px 20px;
        max-width: 1000px;
        margin: 0 auto;
        text-align: center;
    }

    .faq-section {
        width: 100%;
        max-width: 800px;
        margin: 0 auto 80px;
        padding: 10px;
    }

    .faq-item {
        border: 1px solid #ddd;
        border-radius: 8px;
        margin-bottom: 10px;
        overflow: hidden;
    }

    .faq-question {
        background-color: #fff;
        padding: 30px;
        cursor: pointer;
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-weight: bold;
        font-size: 18px;
    }

    .faq-dot {
        width: 15px;
        height: 15px;
        background-color: var(--secondary-color);
        border-radius: 50%;
        flex-shrink: 0;
        margin-right: 5px;
    }

    .faq-content {
        display: flex;
        align-items: center;
        flex-grow: 1;
    }

    .faq-toggle {
        font-size: 18px;
        color: var(--secondary-color);
        transition: transform 0.3s ease;
    }

    .faq-item.active .faq-toggle {
        transform: rotate(180deg);
    }

    .faq-answer {
        padding: 0 15px;
        max-height: 0;
        overflow: hidden;
        transition: max-height 0.3s ease-out;
        background-color: #f9f9f9;
        font-size: 14px;
        color: var(--text-color);
        font-weight: bold;
        line-height: 1.6;
        text-align: left;
    }

    .faq-item.active .faq-answer {
        padding: 15px;
        max-height: 800px;
    }

    /* Media Queries */
    @media screen and (min-width: 1026px) {
        .title { font-size: 30px;}
        .content { padding: 0 30px 30px 10px; }
        .faq-section { max-width: 100%; padding: 20px; margin-top: 30px; margin-bottom: 0px; }
        .faq-question { padding: 30px; font-size: 20px; }
        .faq-dot { width: 28px; height: 28px; margin-right: 12px; }
        .faq-toggle { font-size: 20px; }
        .faq-answer { font-size: 18px; }
    }

    @media screen and (max-width: 1025px) and (min-width: 769px) {
        .title { font-size: 30px;}
        .content { padding: 0 30px 30px 10px; }
        .faq-section { max-width: 100%; padding: 20px; margin-top: 30px; margin-bottom: 0px; }
        .faq-question { padding: 30px; font-size: 20px; }
        .faq-dot { width: 28px; height: 28px; margin-right: 12px; }
        .faq-toggle { font-size: 20px; }
        .faq-answer { font-size: 18px; }
    }

    @media screen and (max-width: 768px) {
        .title { font-size: 25px; padding-top: 30px; }
        .content { padding: 0 15px 15px 15px; max-width: 100%; margin-bottom: 150px; }
        .faq-section { max-width: 800px; padding: 15px; margin-top: 25px; margin-bottom: 0px; }
        .faq-question { padding: 30px; font-size: 18px; }
        .faq-dot { width: 22px; height: 22px; margin-right: 10px; }
        .faq-toggle { font-size: 18px; }
        .faq-answer { font-size: 16px; }
    }

    @media screen and (max-width: 480px) {
        .title { font-size: 22px;padding-top: 40px; }
        .content { padding: 0 10px 40px 10px; }
        .faq-section { max-width: 800px; padding: 15px; }
        .faq-question { padding: 30px; font-size: 16px; }
        .faq-dot { width: 20px; height: 20px; margin-right: 8px; }
        .faq-toggle { font-size: 16px; }
        .faq-answer { font-size: 13px; }
    }
</style>

<script>
    document.querySelectorAll('.faq-item').forEach(item => {
        item.addEventListener('click', () => {
            document.querySelectorAll('.faq-item').forEach(otherItem => {
                if (otherItem !== item) {
                    otherItem.classList.remove('active');
                    otherItem.querySelector('.faq-answer').style.maxHeight = '0';
                    otherItem.querySelector('.faq-answer').style.padding = "0 15px";
                }
            });
            item.classList.toggle('active');
            let answer = item.querySelector('.faq-answer');
            if (item.classList.contains('active')) {
                answer.style.display = 'block';
                answer.style.maxHeight = '0';
                void answer.offsetHeight;
                let height = answer.scrollHeight + 10;
                answer.style.maxHeight = height + 'px';
                answer.style.padding = "15px";
            } else {
                answer.style.maxHeight = '0';
                answer.style.padding = "0 15px";
            }
        });
    });
</script>