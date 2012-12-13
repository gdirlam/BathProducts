using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;

namespace BathProductsTest.validation {
    public static class  MetaData {
        public static bool HasMetadataTypeOf<TAtt>(this Type t) {
            var metadataType = t
                .GetCustomAttributes(typeof(MetadataTypeAttribute), true)
                .FirstOrDefault()
                as MetadataTypeAttribute;
            return metadataType != null && typeof(TAtt) == metadataType.MetadataClassType;
        } 

    }
}
