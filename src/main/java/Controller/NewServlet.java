/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alumno
 */
public class NewServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String nombre = request.getParameter("nombre");
            String apellidoP = request.getParameter("apellidoP");
            String apellidoM = request.getParameter("apellidoM");
            String rut = request.getParameter("rut");
            String dv = request.getParameter("dv");
            String acom = request.getParameter("acom");
            String cantDias = request.getParameter("cantDias");
            String menores = request.getParameter("menores");
            String cantMenores = request.getParameter("cantMenores");
            
            int contador = 0;
            
            if(nombre == "")
                out.print("Nombre no ingresado <p>");
            else{
                out.print(nombre + "<p>");
                contador++;
            }
            
            if(apellidoP == "")
                out.print("Apellido paterno no ingresado <p>");
            else{
                out.print(apellidoP + "<p>");
                contador++;
            }
            
            if(apellidoM == "")
                out.print("Apellido materno no ingresado <p>");
            else{
                out.print(apellidoM + "<p>");
                contador++;
            }
            
            if(rut == "")
                out.print("rut no ingresado <p>");
            else{
                out.print(rut + "<p>");
                contador++;
            }
            
            if(acom == "")
                out.print("Cantidad de acompañantes no ingresado <p>");
            else if(Integer.parseInt(acom) < 0){
                out.print("Cantidad de acompañantes menor a 0");
            }
            else{
                out.print(acom + "<p>");
                contador++;
            }
            
            if(cantDias == "")
                out.print("Cantidad de días no ingresado <p>");
            else if(Integer.parseInt(cantDias) < 1){
                out.print("Cantidad de dias menor a 1");
            }
            else{
                out.print(cantDias + "<p>");
                contador++;
            }

            if(menores == "1")
                if(cantMenores == "")
                    out.print("Cantidad de menores de edad acompañantes no ingresado <p>");
                else if(Integer.parseInt(cantMenores) < 0){
                    out.print("Cantidad de menores menor a 0");
                }
                else if(Integer.parseInt(cantMenores) > Integer.parseInt(acom)){
                    out.print("Cantidad de menores mayor a acompañantes");
                }
                else{
                    out.print(cantMenores + "<p>");
                    contador++;
                }
            else
                contador++;
          
            if (contador == 7){
                int mayores = Integer.parseInt(acom) - Integer.parseInt(cantMenores);
                int total = ((Integer.parseInt(cantMenores) * 8000) + ((mayores+1) * 10000))*Integer.parseInt(cantDias);
                out.print("Total a Pagar = " + total);
            }
            else{
                out.print("El Formulario no esta completo, intentelo de nuevo <p>");
                out.print("<form action=\"index.jsp\">\n" +
                          "    <input type=\"submit\" value=\"Go to Google\" />\n" +
                          "</form>");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
