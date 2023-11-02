
<%
    if (session.getAttribute("error") != null) {
%>
<script>
    new Notify({
        title: 'Error',
        text: '<%= session.getAttribute("error")%>',
        autoclose: true,
        autotimeout: 3000,
        status: 'error',
        effect: 'slide',
        speed: 300 // animation speed
    });
</script>
<%
        session.removeAttribute("error");
    }
%>
<%
    if (session.getAttribute("msg") != null) {
%>
<script>
    new Notify({
        title: 'Success',
        text: '<%= session.getAttribute("msg")%>',
        autoclose: true,
        autotimeout: 3000,
        status: 'success',
        effect: 'slide',
        speed: 300 // animation speed
    });
</script>
<%
        session.removeAttribute("msg");
    }
%>
