<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="util.ConfigUtil" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Disbursement Guidelines</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
            background-color: #f8f9fa;
            display: flex;
            flex-direction: column;
        }

        body {
            flex: 1 0 auto;
            padding-top: 120px; /* Space for fixed header */
        }

        .back-button {
            position: fixed;
            top: 90px;
            left: 70px;
            z-index: 100;
        }
    
        .back-button img {
            width: 80px;
            height: 80px;
        }

        .page-title {
            text-align: center;
            font-size: 65px;
            font-weight: bold;
            padding-top: 30px;
        }

        .sub-title {
            text-align: center;
            margin: 40px 0 60px;
            font-size: 40px;
            color: #666;
        }

        .document-list {
            max-width: 900px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .document-item {
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 35px 40px;
            margin: 60px 0;
            font-size: 20px;
            border-radius: 40px;
            line-height: 1.6;
        }

        .document-item h3 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #333;
        }

        .document-item ul {
            list-style-type: disc;
            padding-left: 40px;
        }

        .document-item ul li {
            margin: 10px 0;
        }

        .receipt-image {
            max-width: 100%;
            height: auto;
            border: 1px solid #ddd;
            border-radius: 10px;
            cursor: pointer; /* Indicate the image is clickable */
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.8);
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            position: relative;
            max-width: 90%;
            max-height: 80%;
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
        }

        .modal-image {
            max-width: 100%;
            max-height: 60vh; /* Limit image height in modal */
            border-radius: 10px;
        }

        .modal-caption {
            margin-top: 15px;
            font-size: 16px;
            color: #333;
        }

        .close {
            position: absolute;
            top: 10px;
            right: 20px;
            font-size: 30px;
            color: #333;
            cursor: pointer;
        }

        /* Responsive Design */
        @media screen and (min-width: 1026px) {
            .page-title {
                font-size: 50px;
                padding-top: 50px;
            }
            .sub-title {
                font-size: 26px;
                margin: 20px 0 10px;
            }
            .document-list {
                max-width: 900px;
                padding-bottom: 20px;
            }
            .document-item {
                display: flex;
                align-items: flex-start;
                padding: 35px 40px;
                margin: 45px 0;
                font-size: 18px;
                border-radius: 15px;
            }
            .document-item h3 {
                font-size: 24px;
            }
            .content-wrapper {
                flex: 1;
                margin-right: 20px;
            }
            .receipt-image {
                max-width: 300px;
                margin-left: 20px;
            }
            .modal-caption {
                font-size: 18px;
            }
            .back-button {
                top: 40px;
                left: 40px;
            }
            .back-button img {
                width: 50px;
                height: 50px;
            }
        }

        @media screen and (max-width: 1025px) {
            .page-title {
                font-size: 50px;
                padding-top: 100px;
            }
            .sub-title {
                font-size: 24px;
                margin: 15px 0 5px;
            }
            .document-list {
                max-width: 600px;
                margin-bottom: 60px;
            }
            .document-item {
                padding: 35px 40px;
                margin: 35px 0;
                font-size: 18px;
                border-radius: 12px;
            }
            .document-item h3 {
                font-size: 22px;
            }
            .receipt-image {
                display: block;
                max-width: 90%;
                margin: 20px auto 0;
            }
            .modal-caption {
                font-size: 16px;
            }
            .back-button {
                top: 30px;
                left: 30px;
            }
            .back-button img {
                width: 40px;
                height: 40px;
            }
        }

        @media screen and (max-width: 768px) {
            .page-title {
                font-size: 35px;
                padding-top: 30px;
                margin-top: 50px;
            }
            .sub-title {
                font-size: 20px;
                margin: 15px 0 -10px;
            }
            .document-list {
                padding: 0 20px;
                margin-bottom: 150px;
            }
            .document-item {
                padding: 30px 35px;
                margin: 40px 0;
                font-size: 16px;
                border-radius: 10px;
            }
            .document-item h3 {
                font-size: 20px;
            }
            .receipt-image {
                max-width: 100%;
            }
            .modal-caption {
                font-size: 14px;
            }
            .back-button {
                top: 20px;
                left: 20px;
            }
            .back-button img {
                width: 35px;
                height: 35px;
            }
        }

        @media screen and (max-width: 480px) {
            .page-title {
                font-size: 30px;
                padding-top: 40px;
                margin-top: 50px;
            }
            .sub-title {
                font-size: 18px;
                margin: 15px 0 5px;
            }
            .document-list {
                padding: 0 10px;
            }
            .document-item {
                padding: 25px 20px;
                margin: 25px 0;
                font-size: 14px;
                border-radius: 8px;
            }
            .document-item h3 {
                font-size: 18px;
            }
            .receipt-image {
                max-width: 100%;
            }
            .modal-caption {
                font-size: 12px;
            }
            .back-button {
                top: 15px;
                left: 15px;
            }
            .back-button img {
                width: 30px;
                height: 30px;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="../menubar.jsp" />
    <h1 class="page-title">Disbursement Guidelines</h1>
    <h2 class="sub-title">Receipt Submission and Reimbursement</h2>

    <div class="document-list">
        <div class="document-item">
            <div class="content-wrapper">
                <h3>Section 1: Receipt Requirements</h3>
                <ul>
                    <li>The buyer’s name must be: <br><strong>School of Engineering, King Mongkut’s Institute of Technology Ladkrabang</strong><br>1 Soi Chalongkrung, Ladkrabang, Bangkok 10520<br>Taxpayer ID: 0994000160623</li>
                    <li>The receipt must include a receipt number and shop name/address or a business card.</li>
                    <li>The receipt date must be within the eligible reimbursement month.</li>
                    <li>The payee must sign the receipt.</li>
                </ul>
            </div>
        </div>

        <div class="document-item">
            <div class="content-wrapper">
                <h3>Section 2: Steps for Receipt Submission</h3>
                <ul>
                    <li>Submit the original receipt by the deadline:</li>
                    <ul>
                        <li>Receipts dated 1st–10th → Submit by the 12th</li>
                        <li>Receipts dated 11th–25th → Submit by the 26th</li>
                        <li>For purchases made from the 26th to the end of the month, contact P’Jean first.</li>
                    </ul>
                    <li>Fill out the Google Form and attach a photo of the receipt for validation and tracking.</li>
                </ul>
            </div>

        </div>

        <div class="document-item">
            <div class="content-wrapper">
                <h3>Section 3: Important Notes</h3>
                <ul>
                    <li>Shipping costs are <strong>NOT</strong> reimbursable.</li>
                    <li>The price of any single item must <strong>NOT</strong> exceed 5,000 THB.</li>
                    <li>Receipts from outside Bangkok should be avoided. If necessary, consult the admin first.</li>
                    <li>E-bills are <strong>NOT</strong> eligible for reimbursement.</li>
                </ul>
            </div>
        </div>
        <div class="document-item">
            <div class="content-wrapper">
                <h3>Example</h3>
            </div>
            <img src="<%= request.getContextPath() %>/images/disbursement/receipt1.jpg" alt="Disbursement-Receipt" class="receipt-image" onclick="openModal('modal1')">
            <img src="<%= request.getContextPath() %>/images/disbursement/receipt2.jpg" alt="Disbursement-Receipt" class="receipt-image" onclick="openModal('modal2')">
        </div>
    </div>

    <!-- Modal for Receipt 1 -->
    <div id="modal1" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('modal1')">&times;</span>
            <img src="<%= request.getContextPath() %>/images/disbursement/receipt1.jpg" alt="Disbursement-Receipt" class="modal-image">
        </div>
    </div>

    <!-- Modal for Receipt 2 -->
    <div id="modal2" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('modal2')">&times;</span>
            <img src="<%= request.getContextPath() %>/images/disbursement/receipt2.jpg" alt="Disbursement-Receipt" class="modal-image">
        </div>
    </div>

    <script>
        function openModal(modalId) {
            document.getElementById(modalId).style.display = 'flex';
        }

        function closeModal(modalId) {
            document.getElementById(modalId).style.display = 'none';
        }

        // Close modal when clicking outside the modal content
        window.onclick = function(event) {
            if (event.target.classList.contains('modal')) {
                document.getElementById('modal1').style.display = 'none';
                document.getElementById('modal2').style.display = 'none';
            }
        }
    </script>
    <jsp:include page="../footer.jsp" />
</body>
</html>