using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace WebEnterprise.Models
{
    public class Department
    {
        //The Department ID
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int deptId { get; set; }
        public string deptName { get; set; }
    }
}