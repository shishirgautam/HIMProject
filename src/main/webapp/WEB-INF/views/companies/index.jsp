<%@include file="../shared/header.jsp" %>
        <h1>Companies!</h1>
        <div class="pull-right">
            <p>
                <a href="${SITE_URL}/companies/add" class="btn btn-default">
                    <span class="glyphicon glyphicon-plus"></span>
                </a>
            </p>
        </div>
        <table class="table table-hover table-striped">
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Email</th>
                <th>Contact No</th>
                <th>Status</th>
                <th>Demands</th>
                <th>Action</th>
                
            </tr>
            <c:forEach var="company" items="${companies}">
                <tr>
                    <td>${company.id}</td>
                    <td>${company.name}</td>
                    <td>
                        ${company.email}
                        <a href="javascript:void(0)" data-param="${company.email}" class="mail-btn btn btn-default btn-xs">
                        <span class="glyphicon glyphicon-envelope"></span>
                        </a>
                    </td>
                    <td>
                        
                        <label class="label label-primary">Phone: ${company.phoneNo}</label><br/>
                        <label class="label label-info">Mobile: ${company.mobileNo}</label>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${company.status}">
                                <label class="label label-success">Active</label>
                            </c:when>
                            <c:otherwise>
                                <label class="label label-danger">Inactive</label>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${company.totalDemands()}</td>
                    <td>
                        <a href="${SITE_URL}/companies/edit/${company.id}" class="btn btn-default">
                            <span class="glyphicon glyphicon-pencil"></span>
                        </a>
                        <a href="${SITE_URL}/companies/delete/${company.id}" class="btn btn-default">
                            <span class="glyphicon glyphicon-trash"></span>
                        </a>
                    </td>
                </tr>
                </c:forEach>
        </table>
<div id="mail-dialog" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title"></h4>
            </div>
            <form id="mail-form">
                <div class="modal-body">
                    <div class="form-group">
                        <label>Subject</label>
                        <input type="text" name="subject" class="form-control" required="required"/>
                    </div>
                    <div class="form-group">
                        <label>Message</label>
                        <textarea name="message" class="form-control" required="required" style="height:150px"></textarea>
                    </div>
                    
                    <input type="hidden" name="email" id="email-id"/>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="send-mail-btn btn btn-primary">Send</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->  
<script>
$(document).ready(function(){
   $(".mail-btn").on('click',function(){
       var $this=$(this);
       var $dialog=$("#mail-dialog");
       var $email=$this.attr('data-param');
       $dialog
               .find('.modal-title')
               .html('Send Mail to '+ $email);
       $("#email-id").val($email);
        $dialog.modal();
   });
   
   $(".send-mail-btn").on('click',function(){
       
      $.post("${SITE_URL}/companies/mail",
              $("#mail-form").serialize(),function(res){
                  //if(res==="success"){
                      document.forms["mail-form"].reset();
                      $("#mail-dialog").modal('hide');
                  //}
       }); 
   });
});
</script>
<%@include file="../shared/footer.jsp" %>