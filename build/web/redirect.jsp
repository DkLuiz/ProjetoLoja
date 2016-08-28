<%--
Visualizações deve ser armazenado na pasta WEB-INF para que
eles não são acessíveis, excepto através do processo de controlador.

Esta JSP está aqui para fornecer um redirecionamento para o despachante
servlet, mas deve ser o único fora JSP de WEB-INF.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% response.sendRedirect("index.htm"); %>
