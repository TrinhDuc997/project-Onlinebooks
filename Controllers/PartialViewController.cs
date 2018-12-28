﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OnlineBooks.Models;


namespace OnlineBooks.Controllers
{
    public class PartialViewController : Controller
    {
        QuanLyBanSachEntities db = new QuanLyBanSachEntities();
        // GET: PartialView
        public ActionResult TopicPartial()
        {
            return PartialView(db.ChuDes.ToList());
        }
        public ActionResult PublishPartialRespon()
        {
            return PartialView(db.NhaXuatBans.ToList());
        }
    }
}