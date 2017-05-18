/**
 * 分页js
 * @returns {Page}
 */
function Page() {
	this.totalPageNum = 0;
	this.minPageCode = 0;
	this.maxPageCode = 0;
	this.pagenum = 0;
	this.isLoaded = true;
	this.currentPage = 1;
	this.callFun;
	this.totalSize = 0;
	this.entitypagename = "";
	this.parameter = {
		currentPage : 1
	};
	this.ismini = false;
	/**
	 * 初始化方法
	 * @param totalNum 总条数
	 * @param parameters 页面参数，可以为数字类型：当前页码或object类型：当前页码+参数
	 * @param totalPage 总页数
	 * @param pageNum 显示页码，如pageNum=3,则显示3个页码
	 * @param isloaded 是否是页码调用，若初始化为false
	 * @param callfun 回调函数
	 * @param pageCodePlace 页码插入位置
	 * @param entityPageName 当前分页实体名称
	 * @param isMini 是否是迷你分页，若：isMini=true,不显示总条数和总页数
	 * @returns {initPage}
	 */
	this.initPage = function initPage(totalNum, parameters, totalPage, pageNum,
			isloaded, callfun, pageCodePlace, entityPageName, isMini) {
		if (totalNum == 0) {
			$("#" + pageCodePlace).empty();
			return;
		}
		this.totalPageNum = totalPage;
		this.minPageCode = 0;
		this.maxPageCode = 0;
		this.pagenum = pageNum > totalPage ? totalPage : pageNum;
		this.isLoaded = isloaded;
		this.callFun = callfun;
		this.totalSize = totalNum;
		this.entitypagename = entityPageName;
		this.parameter = parameters;
		this.ismini = isMini;
		if (isNum(parameters)) {
			this.currentPage = parameters;
		} else {
			this.currentPage = parameters.currentPage;
		}
		var paging;
		if (!this.ismini) {
			paging = "<a href='#' id='firstPage_"
					+ this.entitypagename
					+ "' style='display: none;color:#0000DD;' onclick='javascript:return "
					+ this.entitypagename
					+ ".firstPage();'>首页</a>&nbsp;&nbsp;<a href='#' style='display: none;color:#0000DD;' id='upPage_"
					+ this.entitypagename + "' onclick='javascript:return "
					+ this.entitypagename
					+ ".upPage();'>上一页</a>&nbsp;&nbsp;<span id='page_span_"
					+ this.entitypagename + "'>";
			paging += "</span><a href='#' id='nextPage_"
					+ this.entitypagename
					+ "' onclick='javascript:return "
					+ this.entitypagename
					+ ".nextPage();' style='color:#0000DD;'>下一页</a>&nbsp;&nbsp;<a href='#' style='color:#0000DD;' onclick='javascript:return "
					+ this.entitypagename + ".lastPage();' id='lastPage_"
					+ this.entitypagename + "'>末页</a>&nbsp;&nbsp;&nbsp;&nbsp;";
			paging += "相关结果共<span id='totalNum'>" + totalNum
					+ "</span>条&nbsp;<span id='totalPage'>" + totalPage
					+ "</span>页";
		} else {
			paging = "<a href='#' id='firstPage_"
					+ this.entitypagename
					+ "' style='display: none;color:#0000DD;' onclick='javascript:return "
					+ this.entitypagename
					+ ".firstPage();'>首页</a>&nbsp;&nbsp;<a href='#' style='display: none;color:#0000DD;' id='upPage_"
					+ this.entitypagename + "' onclick='javascript:return "
					+ this.entitypagename
					+ ".upPage();'>上页</a>&nbsp;&nbsp;<span id='page_span_"
					+ this.entitypagename + "'>";
			paging += "</span><a href='#' id='nextPage_"
					+ this.entitypagename
					+ "' onclick='javascript:return "
					+ this.entitypagename
					+ ".nextPage();' style='color:#0000DD;'>下页</a>&nbsp;&nbsp;<a href='#' style='color:#0000DD;' onclick='javascript:return "
					+ this.entitypagename + ".lastPage();' id='lastPage_"
					+ this.entitypagename + "'>末页</a>";
		}
		$("#" + pageCodePlace).empty();//需要插入的位置'pageP'可以修改
		$("#" + pageCodePlace).html(paging);
		this.changPage(this.currentPage);
	};
	/**
	 * 创建显示页面码
	 */
	this.createMMCode = function createMMCode() {
		var index = this.currentPage;
		var tempMinPageCode = this.minPageCode;
		var tempMaxPageCode = this.maxPageCode;
		if (index <= this.pagenum) {
			this.minPageCode = 1;
			this.maxPageCode = this.pagenum;
		} else if (this.totalPageNum - index + 1 <= this.pagenum) {
			this.minPageCode = this.totalPageNum - this.pagenum + 1;
			this.maxPageCode = this.totalPageNum;
		} else if (index < this.minPageCode || index > this.maxPageCode) {

			var step = 0;
			if (this.pagenum % 2 != 0) {
				step = Math.floor(this.pagenum / 2);
				this.minPageCode = index - step;
				this.maxPageCode = index + step;
			} else {
				step = this.pagenum / 2;
				this.minPageCode = index - step;
				this.maxPageCode = index + step - 1;
			}
		}
		if (tempMinPageCode != this.minPageCode
				|| tempMaxPageCode != this.maxPageCode) {
			$("#page_span_" + this.entitypagename).empty();
			$("#page_span_" + this.entitypagename).html(
					this.createPageCode(this.minPageCode, this.maxPageCode));
		}
	};
	/**
	 * 切换页码的状态
	 * @memberOf {TypeName} 
	 */
	this.changePageState = function changePageState() {
		$(".pageCode_" + this.entitypagename).each(function() {
			var code = $(this).html() + "";
			if (code.indexOf("[") == -1) {
				$(this).html("[" + code + "]");
			}
			$(this).addClass("link");
		});
		var currentPageCode = $("#pageCode_" + this.entitypagename + "_"
				+ this.currentPage);
		var currentCode = currentPageCode.html() + "";
		currentPageCode.html(currentCode.substring(1, currentCode.length - 1));
		$("#pageCode_" + this.entitypagename + "_" + this.currentPage)
				.addClass("active");
		this.togglePageCode();
		if (this.isLoaded) {
			if (isNum(this.parameter)) {
				this.parameter = this.currentPage;
			} else {
				this.parameter.currentPage = this.currentPage;
			}
			this.callFun(this.parameter);
		}
		this.isLoaded = true;
	};
	/**
	 * 上一页
	 */
	this.upPage = function upPage() {
		if (this.currentPage < 1) {
			this.currentPage = 1;
		} else {
			this.currentPage -= 1;
		}
		this.createMMCode();
		this.changePageState();
		return false;
	};
	/**
	 * 首页
	 */
	this.firstPage = function firstPage() {
		this.currentPage = 1;
		this.createMMCode();
		this.changePageState();
		return false;
	};
	/**
	 * 下一页
	 */
	this.nextPage = function nextPage() {
		if (this.currentPage > this.totalPageNum) {
			this.currentPage = this.totalPageNum;
		} else {
			this.currentPage += 1;
		}
		this.createMMCode();
		this.changePageState();
		return false;
	};
	/**
	 * 末页
	 */
	this.lastPage = function lastPage() {
		this.currentPage = this.totalPageNum;
		this.createMMCode();
		this.changePageState();
		return false;
	};

	/**
	 * 跳转页面
	 * @param {Object} index
	 */
	this.changPage = function changPage(index) {
		this.currentPage = index;
		this.createMMCode();
		this.changePageState();
		return false;
	};

	/**
	 * 切换首页、上一页、下一页、末页的显隐
	 */
	this.togglePageCode = function togglePageCode() {
		$("#firstPage_" + this.entitypagename).show();
		$("#upPage_" + this.entitypagename).show();
		$("#nextPage_" + this.entitypagename).show();
		$("#lastPage_" + this.entitypagename).show();
		if (this.currentPage == 1) {
			//一直显示首页
			$("#firstPage_" + this.entitypagename).show();
			$("#upPage_" + this.entitypagename).hide();
		}
		if (this.currentPage == this.totalPageNum) {
			//一直显示尾页
			$("#nextPage_" + this.entitypagename).hide();
			$("#lastPage_" + this.entitypagename).show();
		}
	};

	this.createPageCode = function createPageCode(startCode, endCode) {
		var paging = "";
		for ( var i = startCode; i <= endCode; i++) {
			paging += "<a class='pageCode_" + this.entitypagename
					+ "' href='#' onclick='javascript:return "
					+ this.entitypagename + ".changPage(" + i
					+ ");' id='pageCode_" + this.entitypagename + "_" + i
					+ "'>[" + i + "]</a>&nbsp;&nbsp;";
		}
		return paging;
	};
}
function isNum(num) {
	var jgpattern = /^([1-9]\d*)$/;
	if (jgpattern.test(num)) {
		return true;
	} else {
		return false;
	}
}
/**
 * 
 * @memberOf {TypeName} 
 */
function PageArg()
{
	this.totalSize=0;
	this.totalPage=0;
	this.start=0;
	this.end=0;
	this.initArg=function initArg(size,limit,pagecode)
	{
		this.totalSize=size;
		pagesize=(size/limit==Math.floor(size/limit))?size/limit:(Math.floor(size/limit)+1);
		this.totalPage=size==0?0:pagesize;
		this.start=(pagecode-1)*limit;
		this.end=(pagecode)*limit>size?size:(pagecode)*limit;
	};
	this.changePageCode=function changePageCode(pagecode)
	{
		this.start=(pagecode-1)*limit;
	    this.end=(pagecode)*limit>size?size:(pagecode)*limit;
	};
}