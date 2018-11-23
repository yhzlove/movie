/*
jQuery.ganttView v.0.7
Copyright (c) 2010 JC Grubbs - jc.grubbs@devmynd.com
MIT License Applies
*/

/*
Options
-----------------
showWeekends: boolean
data: object
start: date
end: date
cellWidth: number
cellHeight: number
slideWidth: number
*/

(function (jQuery) {
    jQuery.fn.ganttView = function (options) {
		
		var els = this;
		var defaults = { 
			showWeekends: true,
			cellWidth: 3, //月
			cellHeight: 21, 
			slideWidth: 400, 
			vHeaderWidth: 100
		};
		var opts = jQuery.extend(defaults, options);
		var months = Chart.getMonths(opts.start, opts.end);
		
		els.each(function () {
			
			var container = jQuery(this);
			var div = jQuery("<div>", { "class": "ganttview" });
			
			Chart.addVtHeader(div, opts.data, opts.cellHeight);
			
			var slideDiv = jQuery("<div>", {
				"class": "ganttview-slide-container",
 				"css": { "width": opts.slideWidth + "px" }
			});
			
			Chart.addHzHeader(slideDiv, months, opts.cellWidth);
			Chart.addGrid(slideDiv, opts.data, months, opts.cellWidth, opts.showWeekends);
			Chart.addBlockContainers(slideDiv, opts.data);
			Chart.addBlocks(slideDiv, opts.data, opts.cellWidth, opts.start);
			
			div.append(slideDiv);
			container.append(div);
			
			var w = jQuery("div.ganttview-vtheader", container).outerWidth() + 
				jQuery("div.ganttview-slide-container", container).outerWidth();
			container.css("width", (w + 2) + "px");
			
			Chart.applyLastClass(container);
		});
	};
	
	var Chart = {
		//monthNames: ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],
		monthNames: ["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"],
		//monthNames: [],
		getMonths: function (start, end) {
			//alert(start.getYear()+1900);
			var syear=start.getYear();
			var eyear=end.getYear();
			if(start.getYear()<2000){//浏览器不同1e7
				syear=start.getYear()+1900;
			}
			if(end.getYear()<2000){
				eyear=end.getYear()+1900;
			}
			var v=start.getMonth();
			var v2=start.getMonth();
			for(v;v<12;v++){
				this.monthNames[v-start.getMonth()]=syear+"年"+(v+1)+"月";
			}
				if(start.getMonth()!=0){
				for(i=0;i<v2;i++){
this.monthNames[(12-start.getMonth())+i]=eyear+"年"+(i+1)+"月";
				}
				}
			//}
			var months = []; 
//			months[start.getMonth()] = [start];
			months[0] = [start]; 
			var last = start;
			var sgy=start;
			var m=0;
			while (last.compareTo(end) == -1) {
				var next = last.clone().addDays(1);
				//if (!months[next.getMonth()]) {
				//	months[next.getMonth()] = [];
				//	}
				
				if (!months[m]) {
					months[m] = [];
					}
				if(next.getMonth()!=sgy.getMonth()){
					m=m+1;
					months[m] = [next]; 
					sgy=next;
				}
			//	months[next.getMonth()].push(next);
				months[m].push(next);
				last = next;
			}
		
			return months;
		},
		
		addVtHeader: function (div, data, cellHeight) {
			var headerDiv = jQuery("<div>", { "class": "ganttview-vtheader" });
			for (var i = 0; i < data.length; i++) {
				//var itemDiv = jQuery("<div>", { "class": "ganttview-vtheader-item" });
				//itemDiv.append(jQuery("<div>", { 
				//	"class": "ganttview-vtheader-item-name",
				//	"css": { "height": (data[i].series.length * cellHeight) + "px" } 
				//}).append(data[i].name));
				var seriesDiv = jQuery("<div>", { "class": "ganttview-vtheader-series" });
				for (var j = 0; j < data[i].series.length; j++) {
					seriesDiv.append(jQuery("<div>", { "class": "ganttview-vtheader-series-name" })
						//.append(jQuery("<span>").append(data[i].series[j].name)));//data[i].series[j].name
					.append(data[i].series[j].name));

				}
				//itemDiv.append(seriesDiv);
				//headerDiv.append(itemDiv);
				headerDiv.append(seriesDiv);
			}
			div.append(headerDiv);
		},
		
		addHzHeader: function (div, months, cellWidth) {
			var headerDiv = jQuery("<div>", { "class": "ganttview-hzheader" });
			var monthsDiv = jQuery("<div>", { "class": "ganttview-hzheader-months" });
			var daysDiv = jQuery("<div>", { "class": "ganttview-hzheader-days" });
			var totalW = 0;
			for (var i = 0; i < 12; i++) {
				if (months[i]) {
					var w = months[i].length * cellWidth;
					totalW = totalW + w;
					monthsDiv.append(jQuery("<div>", {
						"class": "ganttview-hzheader-month",
						"css": { "width": (w - 1) + "px" }
					}).append(Chart.monthNames[i]));
					for (var j = 0; j < months[i].length; j++) {
						daysDiv.append(jQuery("<div>", { "class": "ganttview-hzheader-day" }));
							//.append(months[i][j].getDate()));
					}
				}
			}
			monthsDiv.css("width", totalW + "px");
			daysDiv.css("width", totalW + "px");
			headerDiv.append(monthsDiv).append(daysDiv);
			div.append(headerDiv);
		},
		
		addGrid: function (div, data, months, cellWidth, showWeekends) {
			var gridDiv = jQuery("<div>", { "class": "ganttview-grid" });
			var rowDiv = jQuery("<div>", { "class": "ganttview-grid-row" });
			for (var i = 0; i < 12; i++) {
				if (months[i]) { 
					for (var j = 0; j < months[i].length; j++) {
						var cellDiv = jQuery("<div>", { "class": "ganttview-grid-row-cell " });
						if (DateUtils.isWeekend(months[i][j]) && showWeekends) { cellDiv.addClass("ganttview-weekend"); }
						rowDiv.append(cellDiv);
					}
				}
			}
			var w = jQuery("div.ganttview-grid-row-cell", rowDiv).length * cellWidth;
			rowDiv.css("width", w + "px");
			gridDiv.css("width", w + "px");
			for (var i = 0; i < data.length; i++) {
				for (var j = 0; j < data[i].series.length; j++) {
					gridDiv.append(rowDiv.clone());
				}
			}
			div.append(gridDiv);
		},
		
		addBlockContainers: function (div, data) {
			var blocksDiv = jQuery("<div>", { "class": "ganttview-blocks" });
			for (var i = 0; i < data.length; i++) {
				for (var j = 0; j < data[i].series.length; j++) {
					//for (var m = 0; m < data[i].series[j].block.length; m++) {
					blocksDiv.append(jQuery("<div>", { "class": "ganttview-block-container" }));
					//}
				}
			}
			div.append(blocksDiv);
		},
		
		addBlocks: function (div, data, cellWidth, start) {
			var rows = jQuery("div.ganttview-blocks div.ganttview-block-container", div);
			var rowIdx = 0;
			var col;
			for (var i = 0; i < data.length; i++) {
				for (var j = 0; j < data[i].series.length; j++) {
					var theleft =0;
					for (var m = 0; m < data[i].series[j].block.length; m++) {
					var size = DateUtils.daysBetween(data[i].series[j].block[m].start, data[i].series[j].block[m].end);
					var offset = DateUtils.daysBetween(start, data[i].series[j].block[m].start);
					
					var left = ((offset * cellWidth) + 3);
					if(m==0){
						theleft=left;
					}else{
						left=left-theleft+10;
					}
					var blockDiv = jQuery("<div>", { 
						"class": "ganttview-block", 
						//"title": data[i].series[j].name + ", " + size + " day",
						"css": { 
							"width": ((size * cellWidth)) + "px",
							"margin-left": left+ "px"
						}
					});
					
					if (data[i].series[j].block[m].color) {
						blockDiv.css("background-color", data[i].series[j].block[m].color);
					}
					
				//	blockDiv.append($("<div>", { "class": "ganttview-block-text" }).text(size));
				blockDiv.append($("<div>", { "class": "ganttview-block-text" }).text(data[i].series[j].block[m].gs));
				//alert(rows.length)	
				if(m==0){
					col = blockDiv;
					//jQuery(rows[rowIdx]).append(blockDiv);
					//alert(blockDiv)
					//alert(jQuery(rows[rowIdx]).html)
				}else{
					col.append(blockDiv);
				}
					}
					jQuery(rows[rowIdx]).append(col);
					//alert(jQuery(rows[rowIdx]).html())
						rowIdx = rowIdx + 1;
				}
				col=null;
			}
		},
		
		applyLastClass: function (div) {
			jQuery("div.ganttview-grid-row div.ganttview-grid-row-cell:last-child", div).addClass("last");
			jQuery("div.ganttview-hzheader-days div.ganttview-hzheader-day:last-child", div).addClass("last");
			jQuery("div.ganttview-hzheader-months div.ganttview-hzheader-month:last-child", div).addClass("last");
		}
		
	};
	
	var ArrayUtils = {
		contains: function (arr, obj) {
			var has = false;
			for (var i = 0; i < arr.length; i++) { if (arr[i] == obj) { has = true; } }
			return has;
		}
	};

	var DateUtils = {
		daysBetween: function (start, end) {
			var count = 0, date = start.clone();
			while (date.compareTo(end) == -1) { count = count + 1; date.addDays(1); }
			return count+2;
		},
		isWeekend: function (date) {
			return date.getDay() % 6 == 0;
		}
	};
	
})(jQuery);