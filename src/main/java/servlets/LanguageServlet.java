package servlets; // Assuming you chose Option 1 from the previous response; adjust if using com.example.servlet

import java.io.IOException;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LanguageServlet")
public class LanguageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String lang = request.getParameter("lang");
        HttpSession session = request.getSession();

        // Set language and locale in the session based on the 'lang' parameter
        if ("th".equals(lang)) {
            session.setAttribute("language", "th");
            session.setAttribute("locale", Locale.of("th", "TH")); // Updated to Locale.of()
        } else {
            // Default to English if lang is 'en' or invalid
            session.setAttribute("language", "en");
            session.setAttribute("locale", Locale.of("en", "US")); // Updated to Locale.of()
        }

        // Get the return URL from the parameter, fallback to home.jsp if not provided
        String returnUrl = request.getParameter("returnUrl");
        if (returnUrl == null || returnUrl.isEmpty()) {
            returnUrl = request.getContextPath() + "/pages/home.jsp";
        }

        // Redirect to the specified return URL
        response.sendRedirect(returnUrl);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}