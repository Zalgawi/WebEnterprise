using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebEnterprise.Models
{
    public class PostImageAjaxModel
    {

        public Post post { get; set; }
        public List<NewFile> images { get; set; }
    }
}