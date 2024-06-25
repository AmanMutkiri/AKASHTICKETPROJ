<!DOCTYPE html>
<script runat="server">

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs)

    End Sub
</script>





<html lang="en" dir="">
<meta http-equiv="content-type" content="text/html;charset=utf-8" />

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>TicketingTool</title>
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet" />
    <link href="../dist-assets/css/themes/lite-purple.min.css" rel="stylesheet" />
    <link href="../dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet" />
</head>

<body class="text-left" style="background-color: #F0FFFF;">
    <form runat="server">
    <div class="row">
        <div class="col-md-4">
            <div class="card mb-4">
                <div class="card-body">
                    <div class="card-title mb-3">Ticket #2024/01130</div>
                  
                        <div class="row " >

                            <div class="col-md-6 form-group mb-3">
                                <label for="picker1">Ticket Type</label>
                                <select class="form-control">
                                    <option>Select</option>
                                    <option>New Development</option>
                                    <option>Bug</option>
                                    <option>Print</option>
                                </select>
                            </div>

                          
                            <div class="col-md-6 form-group mb-3">
                                <label for="firstName1">Customer Name</label>
                                <input class="form-control" id="customerName" type="text" placeholder="Enter your first name" />
                            </div>
                            <div class="col-md-12 form-group mb-3">
                                <label for="firstName1">Ticket Subject</label>
                                <input class="form-control" id="subject" type="text" placeholder="Enter your first name" />
                            </div>
                            <div class="col-md-12 form-group mb-3">
                                <label for="firstName1">Description</label>
                                <input class="form-control" id="Description" type="text" placeholder="Enter your first name" />
                            </div>

                            <div class="col-md-12">
                                <div class="card mb-4">
                                    <div class="card-body ">
                                        <div class="card-title col-md-12">Ticket Status</div>

                                        <label class="radio radio-primary ">
                                            <input type="radio" name="radio" value="0" /><span>Open</span><span class="checkmark"></span>
                                        </label>
                                        <label class="radio radio-primary">
                                            <input type="radio" name="radio" value="1" /><span>Hold</span><span class="checkmark"></span>
                                        </label>
                                        <label class="radio radio-primary">
                                            <input type="radio" name="radio" value="2" /><span>Close</span><span class="checkmark"></span>
                                        </label>
                                        <asp:LinkButton class="btn btn-primary ripple m-1"  ID="LinkButton1" runat="server">LinkButton</asp:LinkButton>
                                      <%-- <a class="btn btn-primary ripple m-1" href="">Save</a>--%>
                                    </div>
                                </div>
                            </div>
                          
                        </div>
                   
                </div>
                
            </div>
        </div>
   
        
    </div>


    <script src="../../dist-assets/js/plugins/jquery-3.3.1.min.js"></script>
    <script src="../../dist-assets/js/plugins/bootstrap.bundle.min.js"></script>
    <script src="../../dist-assets/js/plugins/perfect-scrollbar.min.js"></script>
    <script src="../../dist-assets/js/scripts/script.min.js"></script>
    <script src="../../dist-assets/js/scripts/sidebar.large.script.min.js"></script>
        </form>
</body>

</html>