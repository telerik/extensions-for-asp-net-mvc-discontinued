﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%= Html.Telerik().PanelBar()
       .Name("PanelBar")
       .Items(items =>
       {
		   items.Add().Text("Item 1").HtmlAttributes(new { data_url = Url.Action("Item1Content", "Content") });  
			   
           items.Add().Text("Item 2").HtmlAttributes(new { data_url = Url.Action("Item2Content", "Content") });  
       })
	  .ClientEvents(events =>
        {
            events.OnSelect("Select");
            
        })
%>
<script type="text/javascript">

	function Select(e)
	{
		//get the clicked item and its Url set as an HTML Attribute
		var item = $(e.item);
		var url = item.data("url");
		//get a reference to the splitter and load the corresponding content in the second pane
		splitter = $("#Splitter");

		if (splitter[0] && url)
		{
			splitter.data("tSplitter").ajaxRequest(splitter.find(".t-pane")[1], url);
		}

	}
</script>
