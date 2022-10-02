using Demo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using Newtonsoft.Json;

namespace Demo.Controllers
{
    public class HomeController : Controller
    {
       // SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AuthorBookEntities"].ConnectionString);
        private AuthorBookEntities _db = new AuthorBookEntities();


        [HttpPost]
        public ActionResult createAuthor(Author auth)
        {
            string message = "";
            
            if (auth.AuthorName !=null && auth.BookID !=null)
            {
                var data = _db.AddAuthorBook(auth.AuthorName,auth.BookID.ToString());
                 message = "SUCCESS";
            }
            else
            {
                 message = "Please Enter Values";

            }
            return Json(new { Message = message, JsonRequestBehavior.AllowGet });

        }
        public JsonResult getAuthor()
        {
            var data = _db.GetAuthorBooks().ToList();
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        public JsonResult getBook()
        {
            var data = _db.GetBookData().ToList();
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        public JsonResult createBook(Book book)
        {
            var data = _db.AddBook(book.BookName);
            return Json(data, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Index()
        {
            return View();
        }
    }
}