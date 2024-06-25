using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace AKASHTICKETPROJ
{
    /// <summary>
    /// Summary description for GetCustomerDetails
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class GetCustomerDetails : System.Web.Services.WebService
    {
        

        [WebMethod]
    

        public List<BOCustomerDetails> GetItemWithFilter(string prefix)
        {
           var list = new List<BOCustomerDetails>();
           
            using (var db=new TSS_CRMEntities1())
            {
                list = db.tbls
            .Where(x => (x.CustomerName + x.SID.ToString()).Contains(prefix))
            .Select(x => new BOCustomerDetails
            {
                SID = x.SID,
                CustomerName = x.CustomerName,
                RowID=x.RowID
            })
            .ToList();
            
                return list;  
            }
           
        }
    }
}
