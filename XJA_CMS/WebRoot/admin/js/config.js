$(document).ready(
	function()
	{
		// Over Single Portlet
		$('a.increase').click(function()
			{
				var step=$('#step').val();
				var dir=$("#dire").val();
				var $he=$(this).parent('div').parent('div');
			    if(dir=='1')
			      $he.css('width',($he.width()+parseInt(step))+'px');
			      else
			       $he.css('height',($he.height()+parseInt(step))+'px');
				return false;
			}
		);
		// Over Single Portlet
		$('a.decrease').click(function()
			{
				var step=$('#step').val();
				var dir=$("#dire").val();
				var $he=$(this).parent('div').parent('div');
			    if(dir=='1')
			      $he.css('width',($he.width()-parseInt(step))+'px');
			      else
			       $he.css('height',($he.height()-parseInt(step))+'px');
				return false;
			}
		);
		// Over Single Portlet
		$('a.over').click(function()
			{
				$(this).parent('div').parent().remove();
				return false;
			}
		);
		// Toggle Single Portlet
		$('a.toggle').click(function()
			{
				$(this).parent('div').next('div').toggle();
				return false;
			}
		);

		// Invert All Portlets
		$('a#all_invert').click(function()
			{
				$('div.portlet_content').toggle();
				return false;
			}
		);

		// Expand All Portlets
		$('a#all_expand').click(function()
			{
				$('div.portlet_content:hidden').show();
				return false;
			}
		);

		// Collapse All Portlets
		$('a#all_collapse').click(function()
			{
				$('div.portlet_content:visible').hide();
				return false;
			}
		);

		// Open All Portlets
		$('a#all_open').click(function()
			{
				$('div.portlet:hidden').show();
				$('a#all_open:visible').hide();
				$('a#all_close:hidden').show();
				return false;
			}
		);

		// Close All Portlets
		$('a#all_close').click(function()
			{
				$('div.portlet:visible').hide();
				$('a#all_close:visible').hide();
				$('a#all_open:hidden').show();
				return false;
			}
		);

		// Controls Drag + Drop
		$('#columns td').Sortable(
			{
				accept: 'portlet',
				helperclass: 'sort_placeholder',
				opacity: 0.7,
				tolerance: 'intersect'
			}
		);
	}
);