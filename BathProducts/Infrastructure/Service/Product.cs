using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IoC.Infrastructure.Service {

    public interface IMessagingService {
        string HellowWorldMessage();
    }

    public class MessagingService : IMessagingService {
        public string HellowWorldMessage() {
            return "Ninjected!";
        }
    }
}

