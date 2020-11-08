PrintWriter out = response.getWriter();
response.setContentType("application/json");
response.setCharacterEncoding("UTF-8");
String json="{\"key\":\"value\"}";
out.print(json);
out.flush();