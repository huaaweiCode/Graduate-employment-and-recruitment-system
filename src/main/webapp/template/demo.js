(function() {
    function Init(ele, args) {
        
        if (args.count > 1) {
            this.init(ele, args);
        } else {
            alert('请输入正确的图片数量')
        }
        
    }
    Init.prototype = {
        init : function(ele, args) {
            this.ele = ele,
            this.count = args.count,
            this.time = args.time,
            this.index = 0,
            this.oUl = this.ele.find('.carousel-inner'),
            this.oLi = this.oUl.find('.carousel-item'),
            this.createSpan(), //生成圆点以及左右按钮
            this.handleUl(), //处理图片
            this.automatic(), //自动播放
            this.eventBind()  //点击事件
        },
        createSpan : function() {
            var str = '<div class="carousel-indicators">';
            for (var i = 0; i < this.count; i ++) {
                str += '<span data-index="' + i + '"></span>';
            }
            str += '</div><span class="carousel-btn carousel-prev-btn"></span>' 
            + '<span class="carousel-btn carousel-next-btn"></span>';
            this.ele.append(str);
            this.ele.find('.carousel-indicators span').eq(this.index).addClass('active')
        },
        handleUl : function() {
            var last = this.oLi.eq(0).clone(),
                first = this.oLi.eq(this.count - 1).clone(),
                width = this.ele.width(),
                left = - (this.index + 1) * this.ele.width(); //确认第一张图片的位置
            this.oUl.prepend(first).append(last).css('left', left + 'px');
            this.oUl.width((this.count + 2 ) * width);
        },
        automatic : function() {
            var next = this.ele.find(".carousel-next-btn");
            this.timer = setInterval(function() {
                next.trigger('click')
            }, this.time)
            
        },
        ianimate : function(ileft) {
            var tleft = this.oUl.position().left,
            i = this;
            if(!i.oUl.is(":animated")) {  //判断元素是否处于动画状态
                i.oUl.animate({
                    left : ileft + tleft
                }, function() {
                    var left = i.oUl.position().left,
                        width = i.ele.width();
                    ileft > 0 && left > -width && i.oUl.css('left', - i.count * width); //判断是否是第0张（即最前面的最后一张）
                    ileft < 0 && left <  - i.count * width && i.oUl.css('left', -width); //判断是否是最后一张（即最后面的第一张）
                    i.index = parseInt(- left / width) - 1;
                    i.index = i.index > i.count - 1 ? 0 : i.index;
                    i.index = i.index < 0 ? i.count - 1 : i.index;
                    i.renBtns(); // 给圆点添加特效
            })
            }
            
        },
        renBtns : function() {
            this.ele.find('.carousel-indicators span').removeClass("active").eq(this.index).addClass('active')
        },
        eventBind : function() {
            var i = this,
                prev = this.ele.find(".carousel-prev-btn"),
                next = this.ele.find(".carousel-next-btn"),
                span = this.ele.find(".carousel-indicators"),
                ileft = this.ele.width();
            prev.on('click', function(event) {
                i.ianimate(ileft);
            });
            next.on('click', function(event) {
                i.ianimate(-ileft);
            });
            span.on('click', function(event) {
                var e = event || window.event;
                var target = e.target || e.srcElement;
                i.ianimate(- ($(target).data('index') - i.index) * ileft);
            });
            i.ele.hover(function() {
                clearInterval(i.timer);
            }, function() {
                i.automatic();
            })
        }
    }
    $.fn.sowingMap = function(option) {
        var args = $.extend({
            count : 2,
            time : 3000
        }, option);
        new Init(this, args);
    }
})(jQuery);