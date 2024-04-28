public class GoogleAnalyticsDataWrapper {
    public class GoogleAnalyticsDataRow {
        public Date filterDate { get; set; }
        public Integer activeUsers { get; set; }
        public Integer newUsers { get; set; }
        public Decimal totalRevenue { get; set; }
        public Decimal conversions { get; set; }
        public Integer publisherAdClicks { get; set; }
    }

    public static List<GoogleAnalyticsDataRow> parseResponse(String jsonResponse) {
        List<GoogleAnalyticsDataRow> dataList = new List<GoogleAnalyticsDataRow>();

        Map<String, Object> responseMap = (Map<String, Object>) JSON.deserializeUntyped(jsonResponse);

        List<Object> rows = (List<Object>) responseMap.get('rows');
        for (Object rowObj : rows) {
            Map<String, Object> rowMap = (Map<String, Object>) rowObj;
            List<Object> dimensionValues = (List<Object>) rowMap.get('dimensionValues');
            List<Object> metricValues = (List<Object>) rowMap.get('metricValues');

            String dateString = (String) ((Map<String, Object>) dimensionValues[0]).get('value');
            Date filterDate = Date.valueOf(dateString);

            Integer activeUsers = Integer.valueOf((String)((Map<String, Object>) metricValues[0]).get('value'));
            Integer newUsers = Integer.valueOf((String)((Map<String, Object>) metricValues[1]).get('value'));
            Decimal totalRevenue = Decimal.valueOf((String)((Map<String, Object>) metricValues[2]).get('value'));
            Decimal conversions = Decimal.valueOf((String)((Map<String, Object>) metricValues[3]).get('value'));
            Integer publisherAdClicks = Integer.valueOf((String)((Map<String, Object>) metricValues[4]).get('value'));

            GoogleAnalyticsDataRow rowData = new GoogleAnalyticsDataRow();
            rowData.filterDate = filterDate;
            rowData.activeUsers = activeUsers;
            rowData.newUsers = newUsers;
            rowData.totalRevenue = totalRevenue;
            rowData.conversions = conversions;
            rowData.publisherAdClicks = publisherAdClicks;
            
            dataList.add(rowData);
        }

        return dataList;
    }
}