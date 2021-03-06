<%@page import="entity.Category"%>
<%@page import="entity.Accounts"%>
<%@page import="entity.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("adminaccount") == null) {
		response.sendRedirect(request.getContextPath() + "/admin/Login.jsp");
	}
	List<Book> list = (List<Book>) request.getAttribute("list");
	List<Category> listCategory = (List<Category>) request.getAttribute("listCategory");
	List<Book> newBooks = (List<Book>) request.getAttribute("newBooks");
	List<Book> topBook = (List<Book>) request.getAttribute("topBook");
	int currentPage = (int) request.getAttribute("currentPage");
	long pageSize = (long) request.getAttribute("pageSize");
%>
<jsp:include page="../header.jsp">
	<jsp:param value="Quản lý Truyện" name="title" />
</jsp:include>
<body class="fixed-top">
	<jsp:include page="../sidebar.jsp"></jsp:include>
	<div id="main-content">
		<!-- BEGIN PAGE CONTAINER-->
		<div class="container-fluid">
			<!-- BEGIN PAGE HEADER-->
			<div class="row-fluid">
				<div class="span12">
					<!-- BEGIN THEME CUSTOMIZER-->
					<div id="theme-change" class="hidden-phone">
						<i class="icon-cogs"></i> <span class="settings"> <span
							class="text">Theme:</span> <span class="colors"> <span
								class="color-default" data-style="default"></span> <span
								class="color-gray" data-style="gray"></span> <span
								class="color-purple" data-style="purple"></span> <span
								class="color-navy-blue" data-style="navy-blue"></span>
						</span>
						</span>
					</div>
					<!-- END THEME CUSTOMIZER-->
					<!-- BEGIN PAGE TITLE & BREADCRUMB-->
					<h3 class="page-title">Quản lý Truyện</h3>
					<ul class="breadcrumb">
						<li><a href="<%=request.getContextPath()%>/admin/index"><i
								class="icon-home"></i></a><span class="divider">&nbsp;</span></li>
						<li><a href="#">Quản lý</a> <span class="divider">&nbsp;</span></li>
						<li><a href="#">Quản lý truyện</a><span class="divider-last">&nbsp;</span></li>
					</ul>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span9">
					<div class="widget">
						<div class="widget-title">
							<h4>
								<i class="icon-reorder"></i> Danh sách truyện
							</h4>
							<div class="actions">
								<a href="<%=request.getContextPath()%>/admin/book/insertform">
									<button class="btn btn-success">
										Thêm mới <i class="icon-plus"></i>
									</button>
								</a>
							</div>
						</div>
						<div class="widget-body">
							<div class="space15"></div>
							<%
								for (Book book : list) {
							%>
							<div class="row-fluid blog">
								<div class="span3">
									<img src="<%=request.getContextPath() + book.getLinkImg()%>"
										alt=""
										style="overflow: hidden; min-height: 160px; max-height: 160px; width: auto;">
								</div>
								<div class="span9">
									<h2>
										<a href="#"><font color="#4CC5CD"><%=book.getBookName()%></font></a>
										<%
											if (!book.getChecked()) {
										%>
										<a
											href="<%=request.getContextPath()%>/admin/book/checkbook2/<%=book.getSlug()%>"><span
											class="badge badge-warning">Checked</span></a>
										<%
											}
										%>
										<a href="<%=request.getContextPath()+"/admin/book/delete/"+book.getSlug()%>" class="pull-right"><span class="badge badge-important"><i class="icon-remove"></i></span></a>
									</h2>
									<p>
										Ngày đăng:
										<%=book.getPostDate()%></p>
									<%
										StringBuilder bookAuthor = new StringBuilder();
											if (book.getBook_author() != null) {
												for (Accounts author : book.getBook_author()) {
													bookAuthor.append(author.getUsername() + " ");
												}
											}
											String content = book.getIntroduction();
											if (content != null) {
												if (content.length() > 140)
													content = content.substring(0, 139) + "...";
											} else {
												content = "Chưa có lời giới thiệu";
											}
									%>
									<p>
										Bởi <a href="#"><%=bookAuthor.toString().trim()%></a>
									</p>
									<p><%=content%></p>
									<ul>
										<li><a href="javascript:;"><i class="icon-book"></i>
												<%=book.getChapters().size()%></a></li>
										<li><a href="javascript:;"><i class="icon-heart"></i>
												<%=book.getLikes()%></a></li>
										<li><a href="javascript:;"><i class="icon-link"></i>
												<%=book.getSubcribe()%></a></li>
										<li><a href="javascript:;"><i class="icon-money"></i>
												<%=book.getExchangeses().size()%></a></li>
									</ul>
									<a href="<%=request.getContextPath()+"/user/Detail?idBook="+book.getBookId() %>" class="btn btn-info" target="_blank">Đọc thêm</a> <a
										href="<%=request.getContextPath()%>/admin/book/edit/<%=book.getSlug()%>"
										class="btn btn-warning">Chỉnh sửa</a>
								</div>
							</div>
							<hr />
							<%
								}
							%>
							<div class="row-fluid">
								<div class="span6 btn-group">
									<div class="center ">
										<ol class="pagination">
											<li class="btn<%=currentPage == 1 ? " disabled" : ""%>"><a
												href="<%=request.getContextPath()%>/admin/book/1"> <span><i
														class="icon-chevron-left"></i> Đầu tiên</span>
											</a></li>
											<%
												for (int i = 1; i <= pageSize; i++) {
													if (currentPage == i) {
											%>
											<li class="btn btn-primary"><%=i%></li>
											<%
												} else {
											%>
											<li class="btn"><a
												href="<%=request.getContextPath()%>/admin/book/<%=i%>"><span><%=i%></span></a></li>
											<%
												}
												}
											%>
											<li
												class="btn<%=currentPage == pageSize ? " disabled" : ""%>"><a
												href="<%=request.getContextPath()%>/admin/book/<%=pageSize%>"><span>Cuối
														cùng <i class="icon-chevron-right"></i>
												</span> </a></li>
										</ol>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="span3">
					<div class="widget">
						<div class="blog-side-bar widget-body">
							<h2>Thể loại</h2>
							<p>
								<a href="#" data-toggle="modal" data-target="#addcategory">Thêm
									mới</a>
							</p>
							<div class="clearfix"></div>
							<div id="addcategory" class="modal fade" role="dialog">
								<div class="modal-dialog">

									<!-- Modal content-->
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">Thêm thể loại</h4>
										</div>
										<div class="modal-body">

											<form class="form-horizontal" method="post"
												id="formaddcategory">
												<div class="form-wizard">
													<div class="control-group">
														<label class="control-label">Tên thể loại</label> <input
															type="text" maxlength="100" class="span8"
															name="categoryName" placeholder="Nhập tên thể loại"
															required>
													</div>
													<div class="control-group">
														<label class="control-label">Mô tả</label>
														<textarea rows="6" class="span8" maxlength="2000"
															name="decription"></textarea>
													</div>
													<div class="form-actions clearfix"></div>
													<input type="reset" class="btn btn-default"
														value="Nhập lại"> <input type="button"
														data-dismiss="modal" class="btn btn-default"
														id="categorysubmit" value="Thêm">
												</div>
											</form>
										</div>
									</div>

								</div>
							</div>


							<ul class="unstyled" id="category_sidebar">
								<%=lessCategory(listCategory, request.getContextPath())%>
							</ul>
							<hr />
							<div class="clearfix"></div>
							<h2>Mới nhất</h2>
							<%
								for (Book book : newBooks) {
							%>
							<div class="space10"></div>
							<div class="row-fluid">
								<div class="span3">
									<img src="<%=request.getContextPath() + book.getLinkImg()%>"
										alt="">
								</div>
								<div class="span9">
									<h5>
										<a href="javascript:;"><%=book.getBookName()%></a>
									</h5>
									<p><%=book.getPostDate()%></p>
								</div>
							</div>
							<%
								}
							%>
							<hr />
							<div class="clearfix"></div>
							<h2>Yêu thích nhất</h2>
							<ul class="unstyled tag">
								<%
									for (Book book : topBook) {
								%>
								<li><a href="#"><%=book.getBookName()%></a></li>
								<%
									}
								%>
							</ul>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%!String fullCategory(List<Category> list, String contextPath) {
		StringBuilder s = new StringBuilder();
		for (Category cate : list) {
			s.append("<li><div><a href=\"#\"><i class=\"icon-chevron-right\"></i>" + cate.getCategoryName() + "</a><a href=\""+contextPath+"/admin/category/delete/"+cate.getSlug()+"\" class=\"pull-right\"><i class=\"icon-remove\"></i></a></div></li>");
		}
		if (list.size() > 6) {
			s.append("<li><div><a href=\"#\" id=\"cate_less\"> Thu lại</a></div></li>");
		}
		return s.toString();
	}

	String lessCategory(List<Category> list, String contextPath) {
		StringBuilder s = new StringBuilder();
		int count = 0;
		for (Category cate : list) {
			s.append("<li><div><a href=\"#\"><i class=\"icon-chevron-right\"></i>" + cate.getCategoryName() + "</a><a href=\""+contextPath+"/admin/category/delete/"+cate.getSlug()+"\" class=\"pull-right\"><i class=\"icon-remove\"></i></a></div></li>");
			count++;
			if (count > 6) {
				s.append("<li><div><a href=\"#\" id=\"cate_more\"> Xem thêm</a></div></li>");
				break;
			}
		}
		return s.toString();
	}%>
	<jsp:include page="../footer.jsp"></jsp:include>
	<script type="text/javascript">
		$("#cate_more").click(function() {
			document.getElementById('category_sidebar').innerHTML = '<%=fullCategory(listCategory, request.getContextPath())%>';
		});
	</script>
	<script type="text/javascript">
		$("#cate_less").click(function() {
			document.getElementById('category_sidebar').innerHTML = '<%=lessCategory(listCategory, request.getContextPath())%>';
		});
	</script>
	<script type="text/javascript">
	    $("#categorysubmit").click(function(){
	    $.ajax({
	        type: 'POST',
	        url: '<%=request.getContextPath() + "/admin/book/insertcategory"%>',
			data : $('#formaddcategory').serialize(),
			success : function(response) {
				alert("Thêm thể loại thành công");
				var li = document.createElement("li");
				li.innerHTML = "<li><a href=\"#\"><i class=\"icon-chevron-right\"></i>" + response + "</a></li>"
				document.getElementById('category_sidebar').appendChild(li);
			},
			error : function() {
				alert("Thêm thể loại thất bại");
			}
		});
		});
	</script>
</body>
</html>