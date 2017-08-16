using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class AlertInfo
    {
        public int AlterId { get; set; }

        public string AlertName { get; set; }

        public string AlertType { get; set; }

        public string ApplicabilityRule { get; set; }

        public string DueDays { get; set; }
        public DateTime AlertValidityFrom { get; set; }

        public DateTime AlertValidityTo { get; set; }

        public List<string> Audience { get; set; }

        public string Schedule { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime UpdatedDate { get; set; }

        public int IsDeleted { get; set; }

    }
}
