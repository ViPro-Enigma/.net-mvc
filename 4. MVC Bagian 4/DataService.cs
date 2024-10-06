using log4net;
using System;
using System.Collections.Generic;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Web;
using WebAPIMVC.Controllers;
using WebAPIMVC.Tools;
using static WebAPIMVC.Models.DataModel;
using static WebAPIMVC.Models.DataModel.Request;
using static WebAPIMVC.Models.DataModel.Response;

namespace WebAPIMVC.Services
{
    public class DataService
    {
        private static readonly ILog log = LogManager.GetLogger(typeof(ProductController));
        public Response.MsProduct[] GetProduct()
        {
            BelajarNetDataContext db = new BelajarNetDataContext();
            List<Response.MsProduct> LstP = new List<Response.MsProduct>();

            try
            {
                var AllData = db.GetProduct("", "G");
                foreach (var M in AllData)
                {
                    Response.MsProduct mpro = new Response.MsProduct();
                    mpro.KodeProduct = M.KodeProduct;
                    mpro.NamaProduct = M.NamaProduct;
                    mpro.Brand = M.Brand;
                    mpro.Kategori = M.Kategori;
                    mpro.Qty = Convert.ToInt32(M.Qty);
                    LstP.Add(mpro);
                }
                AppendText.AppendTextFunction("GetProduct", "Sukses");

            }
            catch (Exception ex)
            {
                
            }
            return LstP.ToArray();
        }

        public CRUD[] InsertProduct(string KodeProduct, string NamaProduct, string Brand, string Kategori, string Qty)
        {
            BelajarNetDataContext db = new BelajarNetDataContext();
            List<CRUD> LstP = new List<CRUD>();

            try
            {
                var AllData = db.CRD_Product(KodeProduct, NamaProduct, Brand, Kategori, Convert.ToInt32(Qty),"I");
                foreach (var N in AllData)
                {
                    CRUD mpro = new CRUD();
                    mpro.Status = N.Status;
                    LstP.Add(mpro);
                }
                AppendText.AppendTextFunction("InsertProduct", "Sukses");

            }
            catch (Exception ex)
            {
                
            }
            return LstP.ToArray();
        }
        public CRUD[] UpdateProduct(string KodeProduct, string NamaProduct, string Brand, string Kategori, string Qty)
        {
            BelajarNetDataContext db = new BelajarNetDataContext();
            List<CRUD> LstP = new List<CRUD>();

            try
            {
                var AllData = db.CRD_Product(KodeProduct, NamaProduct, Brand, Kategori, Convert.ToInt32(Qty), "U");
                foreach (var N in AllData)
                {
                    CRUD mpro = new CRUD();
                    mpro.Status = N.Status;
                    LstP.Add(mpro);
                }

            }
            catch (Exception ex)
            {
                
            }
            return LstP.ToArray();
        }

        public CRUD[] DeleteProduct(string KodeProduct, string NamaProduct, string Brand, string Kategori, string Qty)
        {
            BelajarNetDataContext db = new BelajarNetDataContext();
            List<CRUD> LstP = new List<CRUD>();

            try
            {
                var AllData = db.CRD_Product(KodeProduct, NamaProduct, Brand, Kategori, Convert.ToInt32(Qty), "D");
                foreach (var N in AllData)
                {
                    CRUD mpro = new CRUD();
                    mpro.Status = N.Status;
                    LstP.Add(mpro);
                }

            }
            catch (Exception ex)
            {
                
            }
            return LstP.ToArray();
        }
    }
}