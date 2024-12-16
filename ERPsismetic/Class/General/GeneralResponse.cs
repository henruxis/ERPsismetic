using System.Data;

namespace ERPsismetic.Class.Response
{
    public class GeneralResponse
    {
        public int Success { get; set; }
        public string Message { get; set; }
        public object Data { get; set; }
        public DataSet DataSets { get; set; }

    }
}
