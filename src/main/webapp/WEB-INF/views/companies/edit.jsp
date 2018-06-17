<%@include file="../shared/header.jsp" %>
    <div class="page-header">
        <h1>Add Company</h1>
    </div>
    <form method="post" action="${SITE_URL}/companies/save">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">

                    <label>Name</label>
                    <input type="text" name="name" class="form-control" required="required"value="${company.name}" />
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">

                    <label>Contact Person</label>
                    <input type="text" name="contactPerson" class="form-control" required="required"value="${company.contactPerson}" />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">

                    <label>Phone No</label>
                    <input type="text" name="phoneNo" class="form-control" required="required" value="${company.phoneNo}"/>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">

                    <label>Mobile No.</label>
                    <input type="text" name="mobileNo" class="form-control" required="required"value="${company.mobileNo}" />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">

                    <label>Email</label>
                    <input type="email" name="email" class="form-control" required="required" value="${company.email}" />
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">

                    <label>URL</label>
                    <input type="text" name="url" class="form-control" required="required" value="${company.url}" />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">

                    <label>Address</label>
                    <textarea name="address" class="form-control" required="required">${company.address}</textarea>
                </div>
            </div>
        </div>
        <div>
            <input type="hidden" name="id" value="${company.id}" />
            <button type="submit" class="btn btn-success">Save</button>
            <a href="${SITE_URL}/companies" class="btn btn-danger">Back</a>
        </div>
    </form>
    <%@include file="../shared/footer.jsp" %>