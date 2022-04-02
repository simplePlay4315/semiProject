<%@page import="semi.fish.model.vo.Fish"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@include file="/views/header.jsp" %>

<%
	List<Fish> list = (List<Fish>)request.getAttribute("list");

%>

<style>
			
	.card-img-top{  
		width: auto;
		height: 125px;
		
	} 
	#cardDiv{
		border: 1px solid black;
	}
	#cardDiv2{
		border-top: 1px solid black;
	}
</style>

 <!-- Hero -->

    <!-- Card Grid -->
    <div class="container content-space-b-2 content-space-b-lg-2">
        <!-- Nav Scroller -->
        <div class="js-nav-scroller hs-nav-scroller-horizontal mb-1">
            <span class="hs-nav-scroller-arrow-prev" style="display: none;">
          <a class="hs-nav-scroller-arrow-link" href="javascript:;">
            <i class="bi-chevron-left"></i>
          </a>
        </span>

            <span class="hs-nav-scroller-arrow-next" style="display: none;">
          <a class="hs-nav-scroller-arrow-link" href="javascript:;">
            <i class="bi-chevron-right"></i>
          </a>
        </span>
            <br><br><br><br><br>
            <div>
                <h1 class="text-muted text-center">어종</h1>
            </div>

            <!-- Nav -->
            <ul class="js-filter-options nav nav-segment nav-pills d-flex mx-auto mt-5" style="max-width: 13rem; margin-left: 10px">
                <li class="nav-item">
                    <a class="nav-link active" href="javascript:;" data-group="all">전체</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="javascript:;" data-group="민물">민물</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="javascript:;" data-group="바다">바다</a>
                </li>
            </ul>
            <!-- End Nav -->
        </div>
        <!-- End Nav Scroller -->

        <!-- Search -->
        <div class="container py-4">
            <div class="w-lg-75 mx-lg-auto">
                
            </div>
        </div>
    </div>
    <!-- End Search -->
    

    <div class="js-shuffle row row-cols-2 row-cols-sm-2 row-cols-md-4" style="text-align: center; margin: 250px; margin-top: 0px; margin-bottom: 80px;">
        <%for(int i = 0; i < list.size(); i++) {%>
    	<div  class="js-shuffle-item col mb-5" style="padding: 20px;" data-groups='["<%=list.get(i).getType() %>"]'>
            <!-- Card -->
            <a id="cardDiv" class="card card-flush card-transition" href="<%=path%>/fish/view?fishNo=<%=list.get(i).getNo()%>">
                <img class="card-img-top" src="<%=path %>/views/css/fish/FISH_<%=list.get(i).getNo()%>.png" alt="Image Description">
                <div id="cardDiv2" class="card-body">
                    <span class="card-subtitle text-body"><%=list.get(i).getType() %></span>
                    <h3 class="card-title"><%=list.get(i).getName() %></h3>
                </div>
            </a>
            <!-- End Card -->
        </div>
        <!-- End Col -->
    <%} %>

       
    </div>
    <!-- End Row -->
    <!-- End Card Grid -->
    <div style="min-height: auto"></div>


<!-- JS Implementing Plugins -->
<script src="<%=path %>/views/css/hs-mega-menu.min.js"></script>
<script src="<%=path %>/views/css/hs-nav-scroller.min.js"></script>
<script src="<%=path %>/views/css/shuffle.js"></script>

<script>
        (function() {
            // INITIALIZATION OF NAV SCROLLER
            // =======================================================
            new HsNavScroller('.js-nav-scroller')


            // INITIALIZATION OF SHUFFLE
            // =======================================================
            class ShufflePorfolio {
                constructor(element) {
                    this.element = element;
                    this.shuffle = new Shuffle(element, {
                        itemSelector: '.js-shuffle-item',
                        speed: 500
                    })

                    this.addFilterButtons()
                }

                addFilterButtons() {
                    const options = document.querySelector('.js-filter-options')
                    if (!options) {
                        return
                    }

                    const filterButtons = Array.from(options.children)
                    const onClick = this._handleFilterClick.bind(this)
                    filterButtons.forEach((button) => {
                        button.addEventListener('click', onClick, false)
                    });
                }

                _handleFilterClick(evt) {
                    const btn = evt.currentTarget.firstElementChild
                    const isActive = btn.classList.contains('active')
                    const btnGroup = btn.getAttribute('data-group')

                    this._removeActiveClassFromChildren(btn.parentNode.parentNode)

                    let filterGroup
                    if (isActive) {
                        btn.classList.remove('active')
                        filterGroup = Shuffle.ALL_ITEMS
                    } else {
                        btn.classList.add('active')
                        filterGroup = btnGroup  
                    }

                    this.shuffle.filter(filterGroup)
                }

                _removeActiveClassFromChildren(parent) {
                    const {
                        children
                    } = parent
                    for (let i = children.length - 1; i >= 0; i--) {
                        children[i].firstElementChild.classList.remove('active')
                    }
                }
            }

            new ShufflePorfolio(document.querySelector('.js-shuffle'))
        })()
</script>
<%@include file="/views/footer.jsp" %>    