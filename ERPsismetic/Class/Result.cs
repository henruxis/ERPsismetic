using System.Data;

namespace ERPsismetic.Class
{
    public class Result
    {
        public bool Codigo { get; set; }
        public string Description { get; set; } = string.Empty;
        public DataSet Dt { get; set; }
    }
}
