package bean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class dBtest {
    private static final Logger logger = LogManager.getLogger(dBtest.class);

    public static void main(String[] args) {
        Connection conn = null;
        try {
            logger.info("Attempting to connect to database...");
            conn = dBConnection.getConnection();
            logger.info("Connection successful!");
            
            // Perform a simple query to verify database functionality
            try (Statement stmt = conn.createStatement()) {
                ResultSet rs = stmt.executeQuery("SELECT 1");
                if (rs.next()) {
                    logger.info("Database query executed successfully");
                }
            }
            
            // Print connection details
            logger.info("Database product: " + conn.getMetaData().getDatabaseProductName());
            logger.info("Database version: " + conn.getMetaData().getDatabaseProductVersion());
            logger.info("JDBC driver: " + conn.getMetaData().getDriverName());
            logger.info("JDBC version: " + conn.getMetaData().getDriverVersion());
            
        } catch (Exception e) {
            logger.error("Database connection failed: " + e.getMessage(), e);
            e.printStackTrace();
        } finally {
            // Close the connection
            if (conn != null) {
                try {
                    conn.close();
                    logger.info("Database connection closed");
                } catch (Exception e) {
                    logger.error("Error closing connection: " + e.getMessage());
                }
            }
            
            // Shutdown connection cleanup thread
            dBConnection.shutdown();
        }
    }
}