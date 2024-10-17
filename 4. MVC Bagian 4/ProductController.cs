using log4net;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using WebAPIMVC.Services;
using static WebAPIMVC.Models.DataModel;
using static WebAPIMVC.Models.DataModel.Request;
using log4net;
using WebAPIMVC.Tools;
using System.Web.Helpers;

namespace WebAPIMVC.Controllers
{
    [System.Web.Http.Authorize]
    public class ProductController : ApiController
    {
        private static readonly ILog log = LogManager.GetLogger(typeof(ProductController));
        DataMail mail = new DataMail();

        [AllowAnonymous, HttpGet]
        public IHttpActionResult GetProduct()
        {
            Response.MsProduct[] ret = null;
            try
            {

                AppendText.AppendTextFunction("GetProduct", "Proses");
                DataService ds = new DataService();
                ret = ds.GetProduct();


            }
            catch (Exception ex)
            {
                
            }

            return Ok(ret);


        }

        [AllowAnonymous, HttpPost]
        public IHttpActionResult PostProduct(Request.InsUpDelProduct M)
        {
            Response.CRUD[] ret = null;
            try
            {
                AppendText.AppendTextFunction("PostProduct", "Proses");
                DataService ds = new DataService();
                ret = ds.InsertProduct(M.KodeProduct, M.NamaProduct, M.Brand, M.Kategori, M.Qty);

                
            }
            catch (Exception ex)
            {
                
            }

            return Ok(ret);
        }
        [AllowAnonymous, HttpPut]
        public IHttpActionResult PutProduct(Request.InsUpDelProduct M)
        {
            Response.CRUD[] ret = null;
            try
            {
                DataService ds = new DataService();
                ret = ds.UpdateProduct(M.KodeProduct, M.NamaProduct, M.Brand, M.Kategori, M.Qty);


            }
            catch (Exception ex)
            {
                
            }

            return Ok(ret);
        }
        [AllowAnonymous, HttpDelete]
        public IHttpActionResult DeleteProduct(Request.InsUpDelProduct M)
        {
            Response.CRUD[] ret = null;
            try
            {
                DataService ds = new DataService();
                ret = ds.DeleteProduct(M.KodeProduct, M.NamaProduct, M.Brand, M.Kategori, M.Qty);


            }
            catch (Exception ex)
            {
                
            }

            return Ok(ret);
        }

        [AllowAnonymous, HttpGet]
        public IHttpActionResult SendMail()
        {
            Response.CRUD[] ret = null;

            List<Response.CRUD> lcr = new List<Response.CRUD>();
            Response.CRUD mdl = new Response.CRUD();

            try {
                mail.SendMailTest("Test Mail", "InfoToDoList.html", "Rifandi", "Test Mail MVC", "Enigma Camp");
                mdl.Status = "SUCCESS";
                lcr.Add(mdl);

                ret = lcr.ToArray();
            }
            catch(Exception ex)
            {

            }
            return Ok(ret);
        }
    }
}