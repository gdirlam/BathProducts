using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BathProducts.Infrastructure.Repository;

namespace BathProducts.Controllers {

    public class HomeController : Controller {

        public IMessagingService MessagingService { get; private set; }

        public HomeController(IMessagingService messagingService) {
            MessagingService = messagingService;
        }

        public ViewResult Index() {
            ViewBag.Title = MessagingService.SiteName(); 
            return View("");
        }

        public ContentResult ReadMe() {
            return new ContentResult() { Content = MessagingService.ReadMe() };
        }

    }
}
