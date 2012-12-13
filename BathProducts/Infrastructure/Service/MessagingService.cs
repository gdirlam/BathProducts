using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BathProducts.Infrastructure.Repository {

    public interface IMessagingService {
        string ReadMe();
        string SiteName();
    }

    public class MessagingService : IMessagingService {
            
        public string ReadMe() {
        string notes = @"
<h1><u>Solutions Notes.</u></h1>
<pre>

    JQuery Notes: 
    ============de
    - JQuery.tmpl : Uses old template engine, which has a dubious roadmap. This 
        should be switched over to the underscore.js template, because _.js is 
        just so damned cool and it will be nice to have <%= back! I miss you!
    - Uses Quicksand animations library. Should employ more QS features. 
        http://razorjack.net/quicksand/ 
        QS upgraded to version 1.2.2
    - Oddly enough, styles from JQueryUI smoothness are mixed into the CSS, while 
        still using redmond as the JQueryUI style on each page.
    
    T4:
    ==
    Employs two .tt templates for code production.
    1. CRUD SPROC creation in ~\Helper\T4\OrmCRUD.tt Pretty Standard, uses SMO.
        NOTE: Need to able to form a windows authenicated connection to SQL for 
            SMO to work. SQL login is not enough.
    2. Domain Models are created in ~\Models\OrmModel.tt, pipes to a txt file 
        extension so that the code can be moved in if models were altered. Better 
        to make a business object class that inherits from the Domain Model or 
        employ a PITA buddy class.
            NOTE: The OrmModel.tt template used the Visual Studio's COM+ interface 
                EnvDt, which does great stuff but sucks like vb6. This gets the 
                current project name.

    Data Access:
    ===========
        All data access is performed through Stored Procedures. 

    Ninject - IoC:
    =============
        Register new repository mappings to the IoC container in the
            ~\App_Start\NinjectMVC3.cs file.

    Extension Methods:
    =================
        Data Access is done through extension methods, therefore they are static, 
            that means that there are no constructors to inject dependencies into.

        Data Extension Methods implment on the interface IOrmModel or things that 
            inherit from it.
            1. Data Extensions may be implemented in 'Parallel', this means that 
                all things inside of it must be thread-safe.
            2. Dubiously set to throw a SQLException when no data is returned. 
            3. Class Maps to for data row to properties that are set to 
                [AdditionalMetadata('ORM', true)].
            4. Class Mapping identifies Primary Keys properties with 
                [AdditionalMetadata('ORM_PrimaryKey',true)].
            5. Generics of return type T must inherit from IOrmModel.

        Reflection Helper Class
            Some reflection methods are broken off into the reflection helper.

    Cache Dependency:
    ================
        Caching can be turned off in the web.config file. Turn if off for testing.

    To Do:
    =====
        1. Get Chirpy plugin for Visual Studios.
        2. Use Chirpy to convert CoffeeScript to JS.
        3. Use Chirpy to YUI minify js files.
        4. Set up Chirpy to control CSS files and set the background colors as 
            @vars.
        5. Add ELMAH, add a setting to web config file, like cache.

    Things to think about:
    =====================
        Would I be happier if I had T4 make an interface for every domain model it 
            makes?
    
</pre>
            ";
// notes = ""; 
                 return notes;
        }
        public string SiteName() { return "Lydian Naturally"; }
        }
}

